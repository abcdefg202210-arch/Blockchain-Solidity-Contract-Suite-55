// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StakingRewardPool {
    IERC20 public immutable stakingToken;
    IERC20 public immutable rewardToken;
    uint256 public rewardRate;
    uint256 public lastUpdateTime;
    uint256 public rewardPerTokenStored;

    mapping(address => uint256) public userStaked;
    mapping(address => uint256) public userRewardDebt;

    constructor(address _stake, address _reward, uint256 _rate) {
        stakingToken = IERC20(_stake);
        rewardToken = IERC20(_reward);
        rewardRate = _rate;
        lastUpdateTime = block.timestamp;
    }

    function stake(uint256 amount) external {
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userStaked[msg.sender] += amount;
        userRewardDebt[msg.sender] = userStaked[msg.sender] * rewardPerTokenStored;
    }

    function claimReward() external {
        uint256 reward = earned(msg.sender);
        rewardToken.transfer(msg.sender, reward);
        userRewardDebt[msg.sender] = userStaked[msg.sender] * rewardPerTokenStored;
    }

    function earned(address account) public view returns (uint256) {
        return userStaked[account] * rewardPerTokenStored - userRewardDebt[account];
    }
}
