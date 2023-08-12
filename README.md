# Degen Gaming Token (DGT) Smart Contract

The Degen Gaming Token (DGT) is an ERC-20 token smart contract designed for use in a gaming ecosystem. It allows users to purchase in-game items using the token and provides functionality for minting, burning, and managing the in-game store.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Functions](#functions)
- [License](#license)

## Overview

The Degen Gaming Token (DGT) is an ERC-20 token based on the Ethereum blockchain. It extends the OpenZeppelin ERC20 and Ownable contracts, providing additional functionalities specifically designed for gaming applications. The smart contract includes features for minting new tokens, burning tokens, redeeming tokens for in-game items, and managing the in-game store.

## Features

- Minting: The contract owner can mint new DGT tokens.
- Burning: Users can burn their DGT tokens.
- In-Game Store: Users can redeem DGT tokens for in-game items.
- Ownership: The contract includes an Ownable pattern to ensure controlled access.

## Getting Started

1. Clone the repository: `git clone https://github.com/yourusername/degen-gaming-token.git`
2. Install dependencies: `npm install`
3. Compile the contract: `npx hardhat compile`

## Usage

1. Deploy the contract using a development environment like Remix or Hardhat.
2. Mint initial tokens to the owner's account using the `mint` function.
3. Add items to the in-game store using the `addItemToStore` function.
4. Users can obtain DGT tokens by purchasing them or receiving them in transactions.
5. Users can redeem tokens for in-game items using the `redeem` function.
6. Anyone can burn their DGT tokens using the `burn` function.

## Functions

### `mint(address account, uint256 amount)`

Mints a specified amount of DGT tokens and assigns them to the given account.

### `redeem(string memory item)`

Allows users to redeem DGT tokens for in-game items based on the provided item's name.

### `addItemToStore(string memory item, uint256 price)`

Adds a new item to the in-game store with the specified price in DGT tokens.

### `getItemPrice(string memory item)`

Retrieves the price of a specific item in the in-game store.

### `burn(uint256 amount)`

Allows users to burn their DGT tokens, reducing their balance by the specified amount.

## Authors
ex. Mayank Varshney (21BCS7009)

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/21BCS7009/Module-Building-on-Avalanche---ETH-AVAX/blob/main/LICENSE) file for details.

---

For more details and examples, refer to the [OpenZeppelin documentation](https://docs.openzeppelin.com/contracts/4.x/).





