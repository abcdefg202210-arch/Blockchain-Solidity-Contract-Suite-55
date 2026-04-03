// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UltimateERC20Token {
    string public constant name = "Ultimate Chain Token";
    string public constant symbol = "UCT";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;
    mapping(address => bool) public whitelist;

    uint256 public taxRate = 20;
    address public taxWallet;
    address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        owner = msg.sender;
        taxWallet = msg.sender;
        uint256 initialSupply = 100_000_000 * 10**decimals;
        totalSupply = initialSupply;
        balances[msg.sender] = initialSupply;
        emit Transfer(address(0), msg.sender, initialSupply);
    }

    modifier onlyOwner() { require(msg.sender == owner, "Not owner"); _; }
    function addWhitelist(address account) external onlyOwner { whitelist[account] = true; }

    function transfer(address to, uint256 amount) external returns (bool) {
        uint256 tax = (amount * taxRate) / 1000;
        uint256 transferAmount = amount - tax;
        balances[msg.sender] -= amount;
        balances[to] += transferAmount;
        balances[taxWallet] += tax;
        emit Transfer(msg.sender, to, transferAmount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        allowances[from][msg.sender] -= amount;
        uint256 tax = (amount * taxRate) / 1000;
        balances[from] -= amount;
        balances[to] += amount - tax;
        balances[taxWallet] += tax;
        emit Transfer(from, to, amount - tax);
        return true;
    }
}
