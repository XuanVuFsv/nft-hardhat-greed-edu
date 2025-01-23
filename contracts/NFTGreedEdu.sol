// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFTGreedEdu is ERC721 {
    using Strings for uint256;

    address public owner;
    uint256 public mintExp = 0;
    uint16 private max_supply =3;
    uint256 public nextTokenId = 1;

    constructor() ERC721("Greed Edu NFT", "GEN") {
        owner = msg.sender;
        mintExp = block.timestamp + 60*60;
    }

    // Override the _baseURI function
    function _baseURI() internal view virtual override returns (string memory) {
        return "https://ivory-tricky-minnow-831.mypinata.cloud/ipfs/bafybeicf6jhxnwyvxwyn6g6sjalgad5egcqssw3tlyej7nsbxyg4pjfd4y/";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require (_ownerOf(tokenId) != address(0), "No existed Token ID");
        return string(abi.encodePacked(_baseURI(), tokenId.toString(), ".json"));
    }

    modifier canMint() {
        require(block.timestamp < mintExp, "Your are late!");
        _;
    }

    function mint() external canMint {
        _safeMint(msg.sender, nextTokenId++);
    }

    // Function to return the contract address
    function getContractAddress() public view returns (address) {
        return address(this);
    }

    event MintExpireChanged(uint256 newValue);

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You're not the owner");
        _;
    }

        // Function to modify myValue, restricted to the owner
    function modifyMintExpire(uint256 newMintExp) external onlyOwner {
        require(block.timestamp < newMintExp, "New Mint Expire should be greater than current timestamp");
        mintExp = newMintExp;
        emit MintExpireChanged(newMintExp);
    }

    // Optional: Function to retrieve the current value
    function getMintExpire() external view returns (uint256) {
        return mintExp;
    }
}
