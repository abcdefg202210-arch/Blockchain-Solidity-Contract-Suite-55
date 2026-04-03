// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DefiLendingPool {
    mapping(address => uint256) public deposits;
    mapping(address => uint256) public borrows;
    IERC20 public token;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        deposits[msg.sender] += amount;
    }

    function borrow(uint256 amount) external {
        borrows[msg.sender] += amount;
        token.transfer(msg.sender, amount);
    }
}
