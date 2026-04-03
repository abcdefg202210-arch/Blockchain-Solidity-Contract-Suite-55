// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenVestingScheduler {
    mapping(address => uint256) public totalAllocated;
    mapping(address => uint256) public claimed;
    uint256 public duration = 365 days;
    IERC20 public token;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function allocate(address to, uint256 amount) external {
        totalAllocated[to] = amount;
    }

    function claim() external {
        uint256 available = (totalAllocated[msg.sender] * block.timestamp) / duration - claimed[msg.sender];
        claimed[msg.sender] += available;
        token.transfer(msg.sender, available);
    }
}
