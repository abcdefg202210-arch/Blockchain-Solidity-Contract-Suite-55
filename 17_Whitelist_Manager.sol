// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WhitelistManager {
    mapping(address => bool) public whitelist;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function add(address account) external {
        whitelist[account] = true;
    }
}
