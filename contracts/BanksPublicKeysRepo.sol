pragma solidity ^0.5.8;

contract BanksPublicKeysRepo
{
    string suffix = "->PUBLIC_KEY";

    mapping(string => string) PublicKeys;

    function RegisterBankPublicKey(string memory bankName) public
    {
        PublicKeys[bankName] = string(abi.encodePacked(bankName, suffix));
    }

    function GetPublicKeyFor(string memory bankName) public returns (string memory)
    {
        return PublicKeys[bankName];
    }

    function Description() public returns (string memory)
    {
        return "This contract will provide public keys for the registered banks." ;
    }
}



/*
var s
BanksPublicKeysRepo.deployed().then(function (deployed) {s=deployed;});
s.RegisterBankPublicKey("JP MORGAN");
s.RegisterBankPublicKey("CREDIT SUISSE");
s.RegisterBankPublicKey("GOLDMAN SACHS");
s.RegisterBankPublicKey("WELLS FARGO");
s.RegisterBankPublicKey("BANK OF CHINA");

s.GetPublicKeyFor.call("JP MORGAN");
s.GetPublicKeyFor.call("CREDIT SUISSE");
s.GetPublicKeyFor.call("GOLDMAN SACHS");
s.GetPublicKeyFor.call("WELLS FARGO");
s.GetPublicKeyFor.call("BANK OF CHINA");


s.Description.call();

*/
