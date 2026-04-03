// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AccessControlManager {
    mapping(address => bool) public admins;

    function grantAdmin(address account) external {
        admins[account] = true;
    }
}
