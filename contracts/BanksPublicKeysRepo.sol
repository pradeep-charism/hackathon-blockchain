pragma solidity ^0.5.8;

contract BanksPublicKeysRepo
{
    mapping(string => string) PublicKeys;

    function RegisterBankPublicKey(string memory bankName, string memory key) public
    {
        PublicKeys[bankName] = key;
    }

    function GetPublicKey(string memory bankName) public returns (string memory)
    {
        return PublicKeys[bankName];
    }
}
