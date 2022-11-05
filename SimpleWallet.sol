pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract SimpleWallet{ 
address public owner;

mapping(address=>uint)public allowance;
function addAllowance(address _who,uint _amount)public onlyOwner{
    allowance[_who]=_amount;
}
modifier ownerOrAllowed(uint _amount){
    require(_isOwner() || allowance[msg.sender] >= _amount ,"you are not allowed");
    _;
}
    function withdrawMoney(address payable _to,uint _amount)public ownerOrAllowed(_amount) {       
        _to.transfer(_amount);
    }
    
function() external payable{

    // fallback() external payable{

    }
}
