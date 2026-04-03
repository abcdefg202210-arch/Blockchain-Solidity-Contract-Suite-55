// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NFTRoyaltyManager {
    mapping(uint256 => uint256) public royalties;

    function setRoyalty(uint256 tokenId, uint256 fee) external {
        royalties[tokenId] = fee;
    }
}
