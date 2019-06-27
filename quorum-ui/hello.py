from flask import Flask, render_template, request
from web3 import Web3, HTTPProvider
import json
app = Flask(__name__)
w3 = Web3(HTTPProvider('http://localhost:9545'))
banks = [{"name":"Bank of China","key":"BANK OF CHINA->PUBLIC_KEY"}, {"name":"Credit Suisse", "key":"CREDIT SUISSE->PUBLIC_KEY"}, {"name":"J.P. Morgan", "key":"JP MORGAN->PUBLIC_KEY"}]
currentBankName = "Wells Fargos"
currentBankKey = "WELLS FARGO->PUBLIC_KEY"
raw_abi = """[
    {
      "constant": false,
      "inputs": [
        {
          "name": "key",
          "type": "string"
        },
        {
          "name": "currency",
          "type": "string"
        },
        {
          "name": "correspondentBankName",
          "type": "string"
        },
        {
          "name": "city",
          "type": "string"
        },
        {
          "name": "accountNumber",
          "type": "string"
        },
        {
          "name": "swiftId",
          "type": "string"
        }
      ],
      "name": "RegisterBankSsi",
      "outputs": [],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": false,
      "inputs": [
        {
          "name": "key",
          "type": "string"
        }
      ],
      "name": "GetSsiFor",
      "outputs": [
        {
          "name": "",
          "type": "string"
        },
        {
          "name": "",
          "type": "string"
        },
        {
          "name": "",
          "type": "string"
        },
        {
          "name": "",
          "type": "string"
        },
        {
          "name": "",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "constant": false,
      "inputs": [],
      "name": "Description",
      "outputs": [
        {
          "name": "",
          "type": "string"
        }
      ],
      "payable": false,
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]"""
ssiRepoAbi = json.loads(raw_abi)
ssiRepoContract = w3.eth.contract(address='0x3fd901F61fe2b2D954Fef38C1C3E898BD21cd126', abi=ssiRepoAbi)

@app.route("/")
def hello():
    currencies = ['USD','CNH', 'CHF']
    block_number = w3.eth.blockNumber
    return render_template('index.html', banks=banks, currencies=currencies, blockNumber=block_number)

@app.route("/upload")
def upload():
    return render_template('upload.html')

@app.route("/data", methods=['post', 'get'])
def data():
    return render_template('data.html')

@app.route("/data_success", methods=['post', 'get'])
def data_success():
    return render_template('data_success.html', message="Data uploaded!")

@app.route("/transact", methods=['post', 'get'])
def transact():
    bank = request.form.get('bankSelect')
    bankName = getBankName(bank)
    cashAmount = request.form.get('cashAmount')
    currency = request.form.get('currencySelect')
    si = buildSsiDetails(bank, cashAmount, currency)
    return render_template('transaction_finish.html', cashAmount=cashAmount, currency=currency, bankName=bankName, publicKey=bank, si=si)

def buildSsiDetails(bank, cashAmount, currency):
    accounts = queryIIN(currentBankKey, bank, currency) #Query for this from 
    bankName = getBankName(bank)
    accountString = ""
    for account in accounts:
        accountString += "<p/>%s: %s" % (account['type'], account['value'])
    return "From: %s<p/>To: %s<p/>Cash Amount: %s<p/>Currency: %s<p/>Accounts: " % (currentBankName, bankName, cashAmount, currency) + accountString

def queryIIN(currentBankKey, destBankKey, currency):
    ssiKey = "%s:%s:%s" % (currentBankKey, destBankKey, currency)
    output = ssiRepoContract.functions.GetSsiFor(ssiKey).call()
    account = output[3]
    swift = output[4]
    return [{"type":"Account", "value":account},{"type":"SWIFT", "value":swift}]

def getBankName(publicKey):
    for bank in banks:
        if publicKey==bank['key']:
            return bank['name']
    return "Bank Name not found"

if __name__ == "__main__":
    app.run(host="0.0.0.0")

