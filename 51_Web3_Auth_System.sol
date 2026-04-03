// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Web3AuthSystem {
    mapping(address => bool) public authenticated;
    function authenticate() external { authenticated[msg.sender] = true; }
}
