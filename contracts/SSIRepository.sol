pragma solidity ^0.5.8;

contract SSIRepository {

    string suffix = "->PUBLIC_KEY";

    struct Ssi {
        string currency;
        string bankName;
        string city;
        string bankAccount;
        string bankCode;
    }

    mapping(string => Ssi) SsiRepo;

    function RegisterBankSsi(string memory key, string memory currency, string memory bankName, string memory city, string memory bankAccount, string memory bankCode) public {
        Ssi memory newSsi;
        newSsi.currency = currency;
        newSsi.bankName = bankName;
        newSsi.city = city;
        newSsi.bankAccount = bankAccount;
        newSsi.bankCode = bankCode;

        SsiRepo[key] = newSsi;
    }

    function GetSsiFor(string memory key) public returns (string memory, string memory, string memory, string memory, string memory)    {
        return (SsiRepo[key].currency, SsiRepo[key].bankName, SsiRepo[key].city, SsiRepo[key].bankAccount, SsiRepo[key].bankCode);
    }

    function Description() public returns (string memory)    {
        return "This contract will provide SSI for the bank key lookup.";
    }
}





/*
var ssi
SSIRepository.deployed().then(function (deployed) {ssi=deployed;});
ssi.RegisterBankSsi("KEY-1", "USD", "JP Morgan", "NY", "USD-NY-001", "USDJPMNYXXX");
ssi.RegisterBankSsi("KEY-2", "SGD", "Credit Suisse", "SG", "SGD-SG-001", "SGDCSSGXXX");
ssi.RegisterBankSsi("KEY-3", "GBP", "Standard Chartered", "LON", "GBP-LON-001", "GBPSCBLONXXX");

ssi.GetSsiFor.call("KEY-1");
ssi.GetSsiFor.call("KEY-3");

s.Description.call();

*/
