// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MintableERC721 is ERC721 {
    uint256 private _nextTokenId;

    constructor()
        ERC721("Komy | Kyuzan", "KK")
    {}

    function safeMint(address to) public {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        _requireOwned(tokenId);
        return "ipfs://QmUWE26XadeiPWhfQVCgrqYGWLoJrvfVibKhLBWHmSvSir/0";
    }
}
