// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract LeaderboardContract {
    mapping(address => uint256) public _scores;
    address[] private _players;

    event ScoreAddedd(address indexed player, uint256 score);

    function submitScore(uint256 score) external {
        if(_scores[msg.sender] < score) {
            _scores[msg.sender] = score;
            emit ScoreAddedd(msg.sender, score);
        }

        if(score > 0 && !isPlayerRegiestered(msg.sender)) {
            _players.push(msg.sender);
        }
    }

    function isPlayerRegiestered(address player) private view returns(bool) {
        for(uint i = 0; i < _players.length; i++) {
            if(_players[i] == player) {
                return true;
            }
        }
        return false;
    }

    function getRank(address player) external view returns (uint256 rank) {
        uint256 score = _scores[player];
        if(score == 0 ){
            return 0;
        }

        uint256 highestScores = 0;
        for(uint i = 0; i < _players.length; i++) {
            if(_scores[_players[i]] > score) {
                highestScores++;
            }
        }
        return highestScores + 1;
    }

    function getScore(address player) external view returns (uint256 score) {
        return _scores[player]; 
    }
}