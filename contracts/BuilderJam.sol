// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BuilderJam is ERC721 {
    uint256 public mintExp = 0;
    uint256 public nextTokenId = 1;

    constructor() ERC721("Builder Jam NFT", "BJNFT") {
        mintExp = block.timestamp + 60 * 60;
    }

    function tokenURI(
        uint256 tokenId
    ) public pure override returns (string memory) {
        return
            "https://a8-builder-jam-hackathon.s3.ap-southeast-1.amazonaws.com/builder-jam-nft/builder-jam-nft-meta.json";
    }

    modifier canMint() {
        require(block.timestamp < mintExp, "Your are late!");
        _;
    }

    function mint() external canMint {
        _safeMint(msg.sender, nextTokenId++);
    }
}
