// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BlockchainVoting {
    mapping(uint256 => uint256) public votes;
    function castVote(uint256 id) external { votes[id]++; }
}
