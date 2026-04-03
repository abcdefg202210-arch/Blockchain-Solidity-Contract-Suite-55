// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LiquidityPool {
    uint256 public reserveA;
    uint256 public reserveB;

    function addLiquidity(uint256 a, uint256 b) external {
        reserveA += a;
        reserveB += b;
    }
}
