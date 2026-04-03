// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AutomatedYieldFarming {
    IERC20 public stakeToken;
    IERC20 public rewardToken;
    mapping(address => uint256) public stakeBalance;

    constructor(address _stake, address _reward) {
        stakeToken = IERC20(_stake);
        rewardToken = IERC20(_reward);
    }

    function deposit(uint256 amount) external {
        stakeToken.transferFrom(msg.sender, address(this), amount);
        stakeBalance[msg.sender] += amount;
    }

    function harvest() external {
        rewardToken.transfer(msg.sender, stakeBalance[msg.sender] / 100);
    }
}
