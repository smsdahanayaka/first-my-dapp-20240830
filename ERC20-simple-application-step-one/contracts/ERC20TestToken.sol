// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <0.9.0;

// IMPORT OPENZEPPELIN LIBRARY
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract ERC20TestToken is ERC20{
    uint initialSupply = 7000*(10**18);
    constructor() ERC20("ERC20TestToken","ERC20TT"){
        _mint(msg.sender,initialSupply);
    }
}