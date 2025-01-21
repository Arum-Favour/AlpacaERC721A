// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC721A} from "https://github.com/exo-digital-labs/ERC721R/blob/main/contracts/ERC721A.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IERC721} from "https://github.com/exo-digital-labs/ERC721R/blob/main/contracts/IERC721R.sol";

contract Alpaca is ERC721A, Ownable {
    constructor(address initialOwner)
        ERC721A("Alpaca", "ALP")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmY5rPqGTN1rZxMQg2ApiSZc7JiBNs1ryDzXPZpQhC1ibm/";
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}
