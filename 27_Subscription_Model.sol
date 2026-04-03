// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SubscriptionModel {
    mapping(address => uint256) public expiry;

    function subscribe() external payable {
        expiry[msg.sender] = block.timestamp + 30 days;
    }
}
