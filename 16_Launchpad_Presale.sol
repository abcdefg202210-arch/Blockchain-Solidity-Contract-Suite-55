// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LaunchpadPresale {
    uint256 public price = 0.01 ether;
    mapping(address => uint256) public purchases;

    function buy() external payable {
        purchases[msg.sender] += msg.value / price;
    }
}
