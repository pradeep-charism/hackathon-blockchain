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

    mapping(string => string) SsiRepo;

    function registerBankSsi(string memory key, string memory currency, string memory bankName, string memory city, string memory bankAccount, string memory bankCode)
    {
        Ssi memory newSsi;
        newSsi.currency = currency;
        newSsi.bankName = bankName;
        newSsi.city = city;
        newSsi.bankAccount = bankAccount;
        newSsi.bankCode = bankCode;

        SsiRepo[key] = newSsi;
    }


    function RegisterBankPublicKey(string memory bankName) public {
        PublicKeys[bankName] = string(abi.encodePacked(bankName, suffix));
    }

    function GetPublicKeyFor(string memory bankName) public returns (string memory)    {
        return PublicKeys[bankName];
    }

    function Description() public returns (string memory)    {
        return "This contract will provide public keys for the registered banks.";
    }
}





/*
var s
BanksPublicKeysRepo.deployed().then(function (deployed) {s=deployed;});
s.RegisterBankPublicKey("JP Morgan");
s.RegisterBankPublicKey("Credit Suisse");
s.RegisterBankPublicKey("Goldman Sachs");
s.RegisterBankPublicKey("Wells Fargo");
s.RegisterBankPublicKey("Standard Chartered");

s.GetPublicKeyFor.call("JP Morgan");
s.GetPublicKeyFor.call("Goldman Sachs");


s.Description.call();

*/
