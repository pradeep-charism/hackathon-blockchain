pragma solidity ^0.5.8;

contract SsiStore {
    function GetSsiFor(string memory name) public returns (string memory, string memory, string memory, string memory, string memory);
}

contract PublicKeysStore {
    function GetPublicKeyFor(string memory name) public returns (string memory);
}

contract SsiService
{
    function LookupSsi(string memory name) public returns (string memory, string memory, string memory, string memory, string memory)
    {
        SsiStore store = SsiStore(0xEd27042914B46ea48F1433FA026E3f67aB7408a2);
        return store.GetSsiFor(name);
    }

    function LookupPublicKey(string memory name) public returns (string memory)
    {
        PublicKeysStore store = PublicKeysStore(0xEd27042914B46ea48F1433FA026E3f67aB7408a2);
        return store.GetPublicKeyFor(name);
    }
}
