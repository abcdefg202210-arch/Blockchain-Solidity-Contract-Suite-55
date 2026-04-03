// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTMarketplaceV3 {
    struct Order {
        address seller;
        address nftContract;
        uint256 tokenId;
        uint256 price;
        bool isActive;
    }

    mapping(uint256 => Order) public orders;
    uint256 public orderCount;
    address public owner;
    uint256 public feeRate = 25;

    event OrderCreated(uint256 orderId, address seller, address nft, uint256 id, uint256 price);
    event OrderSold(uint256 orderId, address buyer, uint256 price);

    constructor() { owner = msg.sender; }

    function createOrder(address nft, uint256 id, uint256 price) external {
        IERC721(nft).transferFrom(msg.sender, address(this), id);
        orderCount++;
        orders[orderCount] = Order(msg.sender, nft, id, price, true);
        emit OrderCreated(orderCount, msg.sender, nft, id, price);
    }

    function buyOrder(uint256 orderId) external payable {
        Order storage order = orders[orderId];
        require(order.isActive && msg.value == order.price, "Invalid order");
        order.isActive = false;
        uint256 fee = (order.price * feeRate) / 1000;
        payable(order.seller).transfer(order.price - fee);
        payable(owner).transfer(fee);
        IERC721(order.nftContract).transferFrom(address(this), msg.sender, order.tokenId);
        emit OrderSold(orderId, msg.sender, order.price);
    }
}
