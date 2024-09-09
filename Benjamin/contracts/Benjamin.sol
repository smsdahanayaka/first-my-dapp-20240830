// SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Benjamin is ERC20Capped, ERC20Burnable {
    address payable public owner;
    bool public isActive;

    // INITIAL SUPPLY
    uint private _initialSupply = 7000000 * (10 ** decimals());

    // MAX SUPPLY
    uint private _maxSupply = 10000000 * (10 ** decimals());
    uint private _blockRewards = 100 * (10 ** decimals());

    // BLOCK REWARDS
    // uint private _blockRewards;

    constructor() ERC20("BenjaminTKN", "BJN") ERC20Capped(_maxSupply) {
        owner = payable(msg.sender);
        _mint(owner, _initialSupply);
        // _blockRewards = _reward ;
        isActive = true; // Contract is active by default
    }

    // Modifier to restrict function access to owner
    modifier isOwner {
        require(owner == msg.sender, "Only the owner can call this function");
        _;
    }

    // Modifier to check if the contract is active
    modifier whenActive {
        require(isActive, "Contract is inactive");
        _;
    }

    // Set block rewards
    function setRewards(uint _reward) public isOwner whenActive {
        _blockRewards = _reward * (10 ** decimals());
    }

    // Mint miner rewards
    function _mintMinerReward() internal whenActive {
        _mint(block.coinbase, _blockRewards);
    }

    // Override transfer function
    function transfer(address to, uint256 amount) public override whenActive returns (bool) {
        _mintMinerReward(); // Custom logic before transfer
        return super.transfer(to, amount);
    }

    // Override transferFrom function
    function transferFrom(address from, address to, uint256 amount) public override whenActive returns (bool) {
        _mintMinerReward(); // Custom logic before transfer
        return super.transferFrom(from, to, amount);
    }

    // Mark contract as inactive
    function terminate() public isOwner {
        isActive = false;
    }

    // Override _update function
    function _update(address from, address to, uint256 value) internal virtual override(ERC20, ERC20Capped) {
        super._update(from, to, value);

        if (from == address(0)) {
            uint256 maxSupply = cap();
            uint256 supply = totalSupply();
            if (supply > maxSupply) {
                revert ERC20ExceededCap(supply, maxSupply);
            }
        }
    }
}