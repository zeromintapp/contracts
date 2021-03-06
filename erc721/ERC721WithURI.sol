// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./lib/oz/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./lib/oz/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "./lib/oz/contracts/security/Pausable.sol";
import "./lib/oz/contracts/access/AccessControl.sol";
import "./lib/oz/contracts/utils/Context.sol";

contract ERC721WithURI is
	Context,
	ERC721URIStorage, 
	Pausable,
    AccessControl,
    ERC721Burnable
{

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

	constructor (string memory name, string memory symbol)  
	ERC721(name, symbol) 	
	{
		_grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
	}
    
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyRole(MINTER_ROLE)
    {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}


