pragma solidity ^0.5.8;

contract SsiStore {
    function GetSsiFor(string memory name) public returns (string memory, string memory, string memory, string memory, string memory);
}

contract SsiService
{
    function lookupSsi(string memory name) public returns (uint)
    {
        SsiStore store = SsiStore(0xEd27042914B46ea48F1433FA026E3f67aB7408a2);
        return store.GetSsiFor(name);

    }
}
