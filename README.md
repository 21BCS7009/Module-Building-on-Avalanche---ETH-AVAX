# Degen Gaming Token (DGN) - Avalanche Network ERC20 Smart Contract

Degen Gaming Token (DGN) is an ERC20-compliant token deployed on the Avalanche network. It serves as the in-game currency for Degen Gaming platform, allowing players to earn rewards, trade tokens with each other, and redeem them for items in the in-game store. The smart contract includes functionalities for minting new tokens, transferring tokens, redeeming tokens for Ether, checking token balances, and burning tokens when they are no longer needed.

## Description

### Smart Contract Details
* Contract Name: Degen
* Token Name: Degen Gaming Token
* Token Symbol: DGN
* Version: 0.8.18
* SPDX-License-Identifier: MIT

## Getting Started

## Functionalities
### Minting New Tokens
The platform owner can create and distribute new tokens as rewards to players. Only the owner has the authority to mint tokens.

```
function Mint_Token(address to, uint256 value) public onlyOwner {
    _mint(to, value);
}
```
### Transferring Tokens
Players can transfer their tokens to other addresses. They must have a sufficient token balance to initiate the transfer.

```
function Transfer_Tokens(address to, uint256 value) external {
    require(balanceOf(msg.sender) >= value, "Insufficient balance");
    approve(msg.sender, value);
    transferFrom(msg.sender, to, value);
}
```
### Redeeming Tokens for Ether
Players can redeem their tokens for Ether based on a fixed exchange rate of 1 Ether for every 10 tokens. The smart contract must have enough Ether to fulfill the redemption request.

```
function RedeemTokens(uint256 choice) external {
    uint256 tokensToRedeem = choice;
    require(balanceOf(msg.sender) >= tokensToRedeem, "Insufficient tokens to redeem");

    uint256 etherToTransfer = tokensToRedeem / 10; // 1 Ether for every 10 tokens.
    require(address(this).balance >= etherToTransfer, "Contract does not have enough Ether");

    _burn(msg.sender, tokensToRedeem);
    payable(msg.sender).transfer(etherToTransfer);
}
```

### Checking Token Balance
Players can check their token balance at any time using this function.

```
function Check_Balance() external view returns (uint256) {
    return balanceOf(msg.sender);
}
```

### Burning Tokens
Anyone can burn tokens they own, which are no longer needed. This function helps in reducing the total token supply.

```
function Burn_Tokens(uint256 value) external {
    require(balanceOf(msg.sender) >= value, "Insufficient tokens to burn");
    _burn(msg.sender, value);
}
```

### Ownership and Access Control
The smart contract incorporates the OpenZeppelin Ownable contract, which ensures that only the owner of the contract can mint new tokens.

## Authors
ex. Mayank Varshney (21BCS7009)


## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details
