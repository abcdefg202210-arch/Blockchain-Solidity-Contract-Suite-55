// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TimeLockWallet {
    mapping(address => uint256) public lockTime;
    mapping(address => uint256) public balances;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event Withdrawn(address indexed user, uint256 amount);

    function deposit(uint256 unlockTime) external payable {
        require(unlockTime > block.timestamp, "Invalid time");
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = unlockTime;
        emit Deposited(msg.sender, msg.value, unlockTime);
    }

    function withdraw() external {
        require(block.timestamp >= lockTime[msg.sender], "Locked");
        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }
}
