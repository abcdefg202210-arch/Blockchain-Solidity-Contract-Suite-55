// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract InsurancePool {
    mapping(address => uint256) public premiums;

    function payPremium() external payable {
        premiums[msg.sender] += msg.value;
    }
}
