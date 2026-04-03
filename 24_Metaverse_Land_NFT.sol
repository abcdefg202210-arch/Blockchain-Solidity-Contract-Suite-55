// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MetaverseLandNFT is ERC721 {
    uint256 public tokenId;

    constructor() ERC721("MetaLand", "LAND") {}

    function mint() external {
        _mint(msg.sender, tokenId++);
    }
}
