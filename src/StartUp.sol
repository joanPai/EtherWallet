// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StartUp{
    string greet = "hello";
    uint  ten = 10;
    bool  correct = true;
    address person = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32  hash = "0x1234567890abcdef"; 

    function multiply(uint a, uint b ) public pure returns(uint){
        return a * b;
    }

    function divide( uint a, uint b) public pure returns(uint){
        return a / b;
    }

    function add( uint a, uint b) public pure returns(uint){
        return a + b;
    }

    function hashAdd() public pure {
        keccak256(abi.encodePacked(add(10,20)));

    }

    



}