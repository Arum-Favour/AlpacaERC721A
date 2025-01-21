// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC721A} from "https://github.com/exo-digital-labs/ERC721R/blob/main/contracts/ERC721A.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import {IERC721} from "https://github.com/exo-digital-labs/ERC721R/blob/main/contracts/IERC721R.sol";

contract Alpaca is ERC721A, Ownable {
    uint256 public constant price = 1 ether;
    uint256 public constant maxMintPerUser = 5;
    uint256 public constant maxMintSupply = 100;
    constructor(address initialOwner)
        ERC721A("Alpaca", "ALP")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmY5rPqGTN1rZxMQg2ApiSZc7JiBNs1ryDzXPZpQhC1ibm/";
    }

    function safeMint(uint256 quantity) public payable{
        require(msg.value >= quantity * 1 ether, "INSUFFICIENT FUNDS!");
        require(_numberMinted(msg.sender) + quantity <= maxMintPerUser, "Mint Limit");
        require(_totalMinted() + quantity <= maxMintSupply, "SOLD OUT!");
        _safeMint(msg.sender, quantity);
    }

    function withdraw() external onlyOwner {
       uint256 balance = address(this).balance;
       Address.sendValue(payable(msg.sender), balance);
}

}
