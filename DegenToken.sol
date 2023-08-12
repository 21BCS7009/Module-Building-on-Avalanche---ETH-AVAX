// Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have the following functionality:

// Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
// Transferring tokens: Players should be able to transfer their tokens to others.
// Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
// Checking token balance: Players should be able to check their token balance at any time.
// Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Mapping to store the in-game store items and their costs in tokens
    mapping(string => uint256) private _itemPrices;

    event ItemRedeemed(address indexed player, string item);

    constructor() ERC20("Degen Gaming Token", "DGT") {
        // Mint initial supply to the contract deployer (owner)
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    // Function to mint new tokens (only the owner can do this)
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
        emit Transfer(address(0), account, amount);
    }

    // Function to redeem tokens for items in the in-game store
    function redeem(string memory item) public {
        require(_itemPrices[item] > 0, "Item not available for redemption");
        require(balanceOf(msg.sender) >= _itemPrices[item], "Insufficient balance");

        // Perform the redemption (in this example, transfer the tokens to the contract owner)
        _transfer(msg.sender, owner(), _itemPrices[item]);

        emit ItemRedeemed(msg.sender, item);
    }

    // Function to add items and their prices to the in-game store
    function addItemToStore(string memory item, uint256 price) public onlyOwner {
        require(price > 0, "Price must be greater than zero");
        _itemPrices[item] = price;
    }

    // Function to check the price of an item in the in-game store
    function getItemPrice(string memory item) public view returns (uint256) {
        return _itemPrices[item];
    }

    // Function to burn tokens (anyone can do this)
    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _burn(msg.sender, amount);
    }
}
