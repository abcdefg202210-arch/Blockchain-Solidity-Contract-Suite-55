// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155MultiToken is ERC1155 {
    address public owner;

    constructor() ERC1155("ipfs://") {
        owner = msg.sender;
    }

    function mint(address to, uint256 id, uint256 amount) external {
        _mint(to, id, amount, "");
    }
}
