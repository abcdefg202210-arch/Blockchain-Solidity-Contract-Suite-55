// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AirdropDistributor {
    IERC20 public token;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function airdrop(address[] calldata recipients, uint256 amount) external {
        for (uint256 i = 0; i < recipients.length; i++) {
            token.transfer(recipients[i], amount);
        }
    }
}
