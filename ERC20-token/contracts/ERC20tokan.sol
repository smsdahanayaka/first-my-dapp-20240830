// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; // basic function of ERC20
import "@openzeppelin/contracts/access/Ownable.sol"; // ownership management

contract ERC20tokan is ERC20, Ownable {

    // constants
    uint256 public constant TOTAL_SUPPLY = 10000000 * (10**18);
    uint256 public constant MAX_TRAN_LIMIT = (TOTAL_SUPPLY * 2) / 100;
    uint256 public constant MAX_TOKEN_HOLD = (TOTAL_SUPPLY * 5) / 100;

    // tax details
    address public treasuryWallet;
    uint256 public totalTranTax = 3; // total tax transfer (treasury + burn 3%)

    // whitelisting mapping
    mapping(address => bool) public whitelist;

    // constructor 
    constructor(address _treasuryWallet) ERC20("ERC-token20", "ERCT20") Ownable(msg.sender) {
        treasuryWallet=_treasuryWallet;
        _mint(msg.sender, TOTAL_SUPPLY);
    }

    // override transfer function 
    function customTransfer(address _from, address _to, uint256 _amount) public {
        require(_amount <= MAX_TRAN_LIMIT, "Transfer amount exceeds limit");
        require(balanceOf(_to) + _amount <= MAX_TOKEN_HOLD || whitelist[_to], "Recipient balance exceeds limit");

        uint256 taxAmount = _amount * totalTranTax / 100;
        uint256 amountAfterTax = _amount - taxAmount;

        super._transfer(_from, treasuryWallet, taxAmount * 2 / 3);
        super._transfer(_from, address(0), taxAmount / 3);
        super._transfer(_from, _to, amountAfterTax);
    }

    // function to add or remove address from whitelist
    function setWhitelist(address _address, bool _status) external onlyOwner {
        whitelist[_address] = _status;
    }

    // function to update the treasury wallet address
    function setTreasuryWallet(address _address) external onlyOwner {
        treasuryWallet = _address;
    }

    // function to set transfer tax percentage
    function setTransferTaxPercent(uint256 _newTaxPercent) external onlyOwner {
        totalTranTax = _newTaxPercent;
    }
}
