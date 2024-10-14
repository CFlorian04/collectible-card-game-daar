// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Collection.sol";

contract Main {
  uint private collectionCount;
  mapping(uint => Collection) private collections;

  constructor() {
    collectionCount = 0;
  }

  // Créer une nouvelle collection et la stocker
  function createCollection(string calldata name, uint cardCount) external {
    Collection newCollection = new Collection(name, cardCount);
    collections[collectionCount++] = newCollection;
  }

  // Fonction pour minter une carte dans une collection spécifique
  function mintCard(uint collectionId, address to) external {
    require(collectionId < collectionCount, "Collection does not exist");
    collections[collectionId].mintCard(to);
  }

  // Récupérer une collection
  function getCollection(uint collectionId) external view returns (Collection) {
    require(collectionId < collectionCount, "Collection does not exist");
    return collections[collectionId];
  }
}
