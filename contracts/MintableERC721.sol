// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintableERC721 is ERC721Enumerable {
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
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name":"Kappa #', 
                        Strings.toString(tokenId), 
                        '", "description":"NFT for Coinbase Smart Wallet Test", "image":"ipfs://QmQtANpLHGVtukJKFJTRsFBcA2MRoVYT2NXKE7gjnh22Gh/0.png"}'
                    )
                )
            )
        );

        return string(abi.encodePacked('data:application/json;base64,', json));
    }
}
