pragma solidity ^0.5.8;

contract IScoreStore{
    function GetScore(string memory name) public returns (uint);
}

contract MyGame
{
function ShowScore(string memory name) public returns (uint)
    {
        IScoreStore scoreStore = IScoreStore(0xEd27042914B46ea48F1433FA026E3f67aB7408a2);
        return scoreStore.GetScore(name);

    }

}
