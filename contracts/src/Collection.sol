// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Collection is ERC721, Ownable {
  string public collectionName;
  uint public cardCount;
  uint public currentTokenId;

  constructor(
    string memory _name,
    uint _cardCount
  ) ERC721(_name, "NFTC") Ownable(msg.sender) {
    require(bytes(_name).length > 0, "Collection name cannot be empty");
    require(_cardCount > 0, "Card count must be greater than zero");

    collectionName = _name;
    cardCount = _cardCount;
    currentTokenId = 0;
  }

  // Function to mint a new card (NFT) in this collection
  function mintCard(address to) public onlyOwner {
    require(currentTokenId < cardCount, "All cards have been minted");
    _mint(to, currentTokenId);
    currentTokenId++;
  }
}
