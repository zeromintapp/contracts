// @openzeppelin v4.6.0
pragma solidity ^0.8.4;

import "./lib/oz/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";

contract erc721 is ERC721PresetMinterPauserAutoId {

    constructor() public
	ERC721PresetMinterPauserAutoId("erc721", "erc721", "https://test.comA")
	{}

}