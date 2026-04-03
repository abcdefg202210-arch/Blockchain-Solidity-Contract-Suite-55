// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PauseContract {
    bool public paused;

    function pause() external {
        paused = true;
    }
}
