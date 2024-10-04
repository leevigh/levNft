// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract LevNFT is ERC721, Ownable(msg.sender) {
    uint public mintPrice = 0.003 ether;
    uint public totalSupply;
    uint public maxSupply;
    bool public  isMintEnabled;
    mapping(address => uint256) public mintedWallets;

    constructor() payable ERC721('LEV MINT', 'LEVMNT') {
        maxSupply = 3;
    }

    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }

    function mint() external payable {
        require(isMintEnabled, "Mint not enabled");
        require(mintedWallets[msg.sender] < 1, "exceeds max supply");
        require(msg.value == mintPrice, "Not correct amount");
        require(maxSupply > totalSupply, "sold out");

        mintedWallets[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }
}


