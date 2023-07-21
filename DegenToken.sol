// Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have the following functionality:

// Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
// Transferring tokens: Players should be able to transfer their tokens to others.
// Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
// Checking token balance: Players should be able to check their token balance at any time.
// Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.9.2/access/Ownable.sol";

contract Degen is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("Degen", "DGN") {}

    function Mint_Token(address to, uint256 value) public onlyOwner {
        _mint(to, value);
    }

    function Burn_Tokens(uint256 value) external {
        require(balanceOf(msg.sender) >= value, "You do not have enough Tokens");
        _burn(msg.sender, value);
    }

    // Redeem tokens for Ether based on the fixed exchange rate (1 Ether for every 10 tokens).
    function RedeemTokens(uint256 choice) external {
        // Calculate the number of tokens to redeem based on the fixed exchange rate.
        uint256 tokensToRedeem = choice;
        require(balanceOf(msg.sender) >= tokensToRedeem, "Not enough tokens to redeem");

        // Calculate the amount of Ether to send to the redeemer based on the fixed rate.
        uint256 etherToTransfer = tokensToRedeem / 10; // 1 Ether for every 10 tokens.

        // Ensure the contract has enough Ether to send to the redeemer.
        require(address(this).balance >= etherToTransfer, "Contract does not have enough Ether");

        // Transfer the tokens from the redeemer to the contract.
        _burn(msg.sender, tokensToRedeem);

        // Transfer Ether to the redeemer.
        payable(msg.sender).transfer(etherToTransfer);
    }

    function Transfer_Tokens(address to, uint256 value) external {
        require(balanceOf(msg.sender) >= value, "You are not Owner");
        approve(msg.sender, value);
        transferFrom(msg.sender, to, value);
    }

    function Check_Balance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
