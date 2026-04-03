// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GameFiItemSystem {
    mapping(address => mapping(uint256 => uint256)) public items;

    function mintItem(uint256 itemId, uint256 amount) external {
        items[msg.sender][itemId] += amount;
    }
}
