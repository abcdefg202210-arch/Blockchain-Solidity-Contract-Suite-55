// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PaymentStream {
    function sendStream(address to) external payable {
        payable(to).transfer(msg.value);
    }
}
