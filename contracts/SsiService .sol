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
        SsiStore store = SsiStore(0x4eA2702A084baA5739Ac51a485a4FFEE617d5D3B);
        return store.GetSsiFor(name);
    }

    function LookupPublicKey(string memory name) public returns (string memory)
    {
        PublicKeysStore store = PublicKeysStore(0x131F110145a704E028BCa7B85EAE33E32f94097C);
        return store.GetPublicKeyFor(name);
    }
}
