// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Playground {
    IERC20 rewardToken;
    struct Profile {
        NFTStats[3] registeredNFTs;
        uint accumulatedRewards;
    }
    struct NFTStats {
        IERC721 registeredNFT;
        uint tokenId;
        uint level;
        uint experience;
    }
    mapping(address => Profile) registedProfiles;
    constructor(IERC20 tokenAddr) {
        rewardToken = tokenAddr;
    }
    function replaceRewardToken(IERC20 newToken) public {
        rewardToken = newToken;
    }
    function registerNFT(address user, uint8 index, uint256 tokenId, IERC721 nft) public {
        require(nft.ownerOf(tokenId) == user, "user does not own this token");
        registedProfiles[user].registeredNFTs[index].registeredNFT = nft;
        registedProfiles[user].registeredNFTs[index].tokenId = tokenId;
        registedProfiles[user].registeredNFTs[index].level = 0;
        registedProfiles[user].registeredNFTs[index].experience = 0; 
    }
    //withdraw rewards
    //stake rewards
    //pay to enhance skill etc.

    // combat two nft's

    // calculate combat
    function combat(address user1, uint8 index1, address user2, uint8 index2) public {
        addExperience(user1, index1);
        addExperience(user2, index2);
    }

    function addExperience(address user, uint8 index) public {
        registedProfiles[user].registeredNFTs[index].level++;
        registedProfiles[user].registeredNFTs[index].experience + 3; 
    }

    function findOpponent() {
        // look through registed users
        // find opponent with similar level
        // battle roll dice
        // 
    }
} 