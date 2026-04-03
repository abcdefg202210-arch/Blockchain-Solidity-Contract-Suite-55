// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OraclePriceFeed {
    address public owner;
    uint256 public price;

    constructor() {
        owner = msg.sender;
    }

    function updatePrice(uint256 newPrice) external {
        price = newPrice;
    }
}
