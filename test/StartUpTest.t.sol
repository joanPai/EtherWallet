// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {DeployStartUp} from "script/DeployStartUp.s.sol";
import {Test} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/vendor/forge-std/src/Test.sol";
import {StartUp} from "src/StartUp.sol";

contract StartUpTest is Test{
    DeployStartUp deployStartUp;
    StartUp startUp;
   
    
    function setUp() public{
        vm.startBroadcast();
        deployStartUp = new DeployStartUp();
        startUp = deployStartUp.run();
        vm.stopBroadcast();
    }

}