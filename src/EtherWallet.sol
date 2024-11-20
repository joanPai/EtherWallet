// SPDX-License-Identifier: MIT
// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function 
// fallback function 
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.0;

/////////////////////////
//imported contracts   //
/////////////////////////
import {ReentrancyGuard} from "lib/openzeppelin-contracts/contracts/utils/ReentrancyGuard.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract EtherWallet is Ownable, ReentrancyGuard {

    ///////////////
    //error      //    
    /////////////// 
    error EtherWallet__WithdrawFailed();

    ///////////////
    //event      //    
    /////////////// 

    event withdrawal(address indexed user, uint amount); 
    
    
    ///////////////
    //constructor//
    ///////////////  
    constructor() Ownable(msg.sender) ReentrancyGuard() {}


      
    ///////////////
    //functions  //
    ///////////////  
    receive() external payable {}


    function withdraw(uint amount) external onlyOwner nonReentrant {
        (bool success,) = owner().call{value: amount}("");
        if( !success){
            revert EtherWallet__WithdrawFailed();
        }
        emit withdrawal(msg.sender, amount);
    }
 

    function checkBalance() external view returns (uint){
        return address(this).balance;
    }



}