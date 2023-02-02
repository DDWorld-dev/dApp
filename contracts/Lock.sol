// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.9; 
 
 
 
contract Lock { 
    address public owner; 
    constructor() { 
        owner = msg.sender; 
    } 
    modifier onlyOwner() { 
        require(msg.sender == owner, 'not an owner'); 
        _; 
    } 
    function getAddress() public view onlyOwner returns(address){ 
        return msg.sender; 
    } 
}