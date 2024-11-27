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
    error EtherWallet__insufficientBalance();

    ///////////////
    //event      //
    ///////////////

    event Withdrawal(address indexed user, uint256 amount);

    ///////////////
    //constructor//
    ///////////////
    constructor() Ownable(msg.sender) ReentrancyGuard() {}

    ///////////////
    //functions  //
    ///////////////
    receive() external payable {}

    function withdraw(uint256 amount) external onlyOwner nonReentrant {
        if (address(this).balance < amount) revert EtherWallet__insufficientBalance();
        (bool success,) = owner().call{value: amount}("");
        if (!success) {
            revert EtherWallet__WithdrawFailed();
        }
        emit Withdrawal(msg.sender, amount);
    }

    function checkBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
