// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTStakingSystem {
    struct Stake {
        uint256 tokenId;
        uint256 startTime;
    }

    mapping(address => Stake[]) public stakes;
    IERC721 public nft;

    constructor(address _nft) {
        nft = IERC721(_nft);
    }

    function stake(uint256 tokenId) external {
        nft.transferFrom(msg.sender, address(this), tokenId);
        stakes[msg.sender].push(Stake(tokenId, block.timestamp));
    }
}
