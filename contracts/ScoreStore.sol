pragma solidity ^0.5.8;

contract ScoreStore
{
mapping (string=> uint) PersonScores;

function AddPersonScore(string memory name, uint score) public
{
        PersonScores[name] = score;
}

function GetScore(string memory name) public returns (uint)
{
    return PersonScores[name];
}

}
