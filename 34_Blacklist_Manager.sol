// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BlacklistManager {
    mapping(address => bool) public blacklisted;

    function ban(address account) external {
        blacklisted[account] = true;
    }
}
