// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC721Collection is ERC721 {
    uint256 public tokenId;
    string public baseURI;

    constructor(string memory name, string memory symbol, string memory uri) ERC721(name, symbol) {
        baseURI = uri;
    }

    function mint() external {
        _mint(msg.sender, tokenId++);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
}
