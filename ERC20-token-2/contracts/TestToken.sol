// SPDX-License-Identifier: MIT


pragma solidity >=0.7.0 <0.9.0;

// OPENZEPPELIN LIBRIES
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestToken is ERC20{

    uint private totalSup=7000*(10**decimals());
    uint private maxTransferLimit=(totalSup*2)/100;
    uint private maxtokan=(totalSup*5)/100;

    uint private trnasrTaxPrecentage=3;

    address private owner;
    address private treasuryWallet;

    mapping (address=>bool) public whiteList;

    constructor(address _treasuryWallet) ERC20("TestToken","ttkn"){
        owner=msg.sender;
        treasuryWallet=_treasuryWallet;

        _mint(owner,totalSup);
    }

    // MODIFIYERS
    modifier isOwner{
        require(msg.sender==owner,"Owner only can access this");
        _;
    }

    modifier isAllowd(address _from,address _to, uint _amount){
       
            require(_amount<= maxTransferLimit,"Transfer amount exceed max limit");
            require(balanceOf(_to)+_amount < maxtokan,"Tokan limit exceed wallet");
        
        _;
    }

    // FUNCTION OF SET TREASURY WALLET
    function setTreasuryWallet(address _treasuryWallet)external isOwner {
        treasuryWallet=_treasuryWallet;
    }

    // FUNCTION OF SET WHITE LIST
    function setWhiteList(address _address, bool _isTrue)external isOwner{
        whiteList[_address]=_isTrue;
    }

    // FUNCTION OF SET TRANSFER TAX PRECENTAGE
    function setTranserTaxPre(uint _preAmount)external isOwner{
        trnasrTaxPrecentage=_preAmount;
    }

    // FUNCTION OF TRANSFER 
    function transfer(address _from, address _to, uint _amount)public isAllowd(_from,_to,_amount) {
        uint taxAmount=0;
        uint amountAfterTax=_amount;

        if(!whiteList[_from] && !whiteList[_to]){
            taxAmount=(_amount*trnasrTaxPrecentage)/100;
            amountAfterTax=_amount-taxAmount;
             _transfer(_from, _to, amountAfterTax);
            _transfer(_from, treasuryWallet, (taxAmount*2)/3);
            _burn(_from, (taxAmount*1)/3);

        }else{
            taxAmount=0;
            amountAfterTax=_amount;
            _transfer(_from, _to, amountAfterTax);
        }
    }
}