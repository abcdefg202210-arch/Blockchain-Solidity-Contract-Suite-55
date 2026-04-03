// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UpgradeableProxy {
    address public implementation;

    function upgrade(address newImpl) external {
        implementation = newImpl;
    }
}
