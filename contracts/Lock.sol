// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.9; 
 
 
 
contract Lock { 
    address[] public owner; 
    mapping (address => uint) public amount;
    constructor() { 
        owner.push(msg.sender); 
    } 
    modifier onlyOwner() { 
        uint checkOwner = 0;
        for(uint i = 0; i <= owner.length; i++){
            if(owner[i] == msg.sender){
                checkOwner = i;
                break;
            }
        }
        require(owner[checkOwner] == msg.sender, "not an owner!");
       _;
    } 
    function getAddress() public view onlyOwner returns(address){ 
        return msg.sender; 
    } 
    function mint() public payable{
        require(msg.value >= 2000, "not anouth funds");
        amount[msg.sender] += 1;
    }
    function makeOwner() public{
        require(amount[msg.sender] >= 3, "error");
        owner.push(msg.sender);
    }
}