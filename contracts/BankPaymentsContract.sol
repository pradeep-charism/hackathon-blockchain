pragma solidity ^0.5.8;

contract BankPaymentsContract {

    string suffix = "->PUBLIC_KEY";

    struct Ssi {
        string currency;
        string correspondentBankName;
        string city;
        string accountNumber;
        string swiftId;
    }


    mapping(string => string) PublicKeys;

    mapping(string => Ssi) SsiRepo;

    function PayBank(string memory correspondent, string memory beneficiary, int quantity, int amount, string memory currency) public returns (string memory, string memory, int, int, string memory, string memory, string memory, string memory){
        string memory bankA = GetPublicKeyFor(correspondent);
        string memory bankB = GetPublicKeyFor(beneficiary);
        string memory ssiKey = string(abi.encodePacked(bankA, ":", bankB, ":", currency));

        return (correspondent, beneficiary, quantity, amount, SsiRepo[ssiKey].currency, SsiRepo[ssiKey].city, SsiRepo[ssiKey].accountNumber, SsiRepo[ssiKey].swiftId);
    }

    function RegisterBankSsi(string memory key, string memory currency, string memory correspondentBankName, string memory city, string memory accountNumber, string memory swiftId) public {
        Ssi memory newSsi;
        newSsi.currency = currency;
        newSsi.correspondentBankName = correspondentBankName;
        newSsi.city = city;
        newSsi.accountNumber = accountNumber;
        newSsi.swiftId = swiftId;

        SsiRepo[key] = newSsi;
    }

    function GetSsiFor(string memory key) public returns (string memory, string memory, string memory, string memory, string memory)    {
        return (SsiRepo[key].currency, SsiRepo[key].correspondentBankName, SsiRepo[key].city, SsiRepo[key].accountNumber, SsiRepo[key].swiftId);
    }


    function RegisterBankPublicKey(string memory bankName) public
    {
        PublicKeys[bankName] = string(abi.encodePacked(bankName, suffix));
    }

    function GetPublicKeyFor(string memory bankName) public returns (string memory)
    {
        return PublicKeys[bankName];
    }

    function Description() public returns (string memory)    {
        return "This contract will provide SSI for the bank key lookup.";
    }
}





/*

var ssi
BankPaymentsContract.deployed().then(function (deployed) {ssi=deployed;});
ssi.RegisterBankPublicKey("JP MORGAN");
ssi.RegisterBankPublicKey("WELLS FARGO");
ssi.RegisterBankSsi("WELLS FARGO->PUBLIC_KEY:JP MORGAN->PUBLIC_KEY:USD", "USD", "JP Morgan", "New York", "USD-NY-001", "USDJPMNYXXX");

var ssi
BankPaymentsContract.deployed().then(function (deployed) {ssi=deployed;});
ssi.RegisterBankPublicKey("JP MORGAN");
ssi.RegisterBankPublicKey("WELLS FARGO");
ssi.RegisterBankPublicKey("CREDIT SUISSE");
ssi.RegisterBankPublicKey("GOLDMAN SACHS");
ssi.RegisterBankPublicKey("BANK OF CHINA");

ssi.GetPublicKeyFor.call("JP MORGAN");
ssi.GetPublicKeyFor.call("CREDIT SUISSE");
ssi.GetPublicKeyFor.call("GOLDMAN SACHS");
ssi.GetPublicKeyFor.call("WELLS FARGO");
ssi.GetPublicKeyFor.call("BANK OF CHINA");

ssi.RegisterBankSsi("WELLS FARGO->PUBLIC_KEY:JP MORGAN->PUBLIC_KEY:USD", "USD", "JP Morgan", "New York", "USD-NY-001", "USDJPMNYXXX");
ssi.RegisterBankSsi("WELLS FARGO->PUBLIC_KEY:CREDIT SUISSE->PUBLIC_KEY:CHF", "CHF", "Credit Suisse", "Zurich", "CHF-CS-ZUR-001", "CHFCSZURXXX");
ssi.RegisterBankSsi("WELLS FARGO->PUBLIC_KEY:BANK OF CHINA->PUBLIC_KEY:CNH", "CNH", "Bank of China", "Hong kong", "CNH-BOC-HK-001", "CNHBOCHKXXX");
ssi.GetSsiFor.call("WELLS FARGO->PUBLIC_KEY:JP MORGAN->PUBLIC_KEY:USD");
ssi.GetSsiFor.call("WELLS FARGO->PUBLIC_KEY:CREDIT SUISSE->PUBLIC_KEY:CHF");
ssi.GetSsiFor.call("WELLS FARGO->PUBLIC_KEY:BANK OF CHINA->PUBLIC_KEY:CNH");

ssi.PayBank.call("WELLS FARGO", "JP MORGAN", 10, 10, "USD");


s.Description.call();


*/
