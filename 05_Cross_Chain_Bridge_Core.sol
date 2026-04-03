// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CrossChainBridgeCore {
    address public validator;
    mapping(bytes32 => bool) public processedTx;

    event CrossChainTransfer(address indexed user, uint256 chainId, uint256 amount);
    event CrossChainReceive(address indexed user, uint256 amount);

    constructor() { validator = msg.sender; }

    function transferToChain(uint256 destChain, uint256 amount) external payable {
        require(msg.value == amount, "Invalid amount");
        bytes32 txId = keccak256(abi.encodePacked(msg.sender, destChain, amount, block.timestamp));
        emit CrossChainTransfer(msg.sender, destChain, amount);
    }

    function receiveFromChain(address user, uint256 amount, bytes32 txId) external {
        require(!processedTx[txId], "Already processed");
        processedTx[txId] = true;
        payable(user).transfer(amount);
        emit CrossChainReceive(user, amount);
    }
}
