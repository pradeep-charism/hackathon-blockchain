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
s.RegisterBankPublicKey("JP Morgan");
s.RegisterBankPublicKey("Credit Suisse");
s.RegisterBankPublicKey("Goldman Sachs");
s.RegisterBankPublicKey("Wells Fargo");
s.RegisterBankPublicKey("Standard Chartered");

s.GetPublicKeyFor.call("JP Morgan");
s.GetPublicKeyFor.call("Goldman Sachs");


s.Description.call();

*/
