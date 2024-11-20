// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import {Script} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/vendor/forge-std/src/Script.sol";
import {EtherWallet} from "src/EtherWallet.sol";

contract DeployEtherWallet is Script{
    
    
    function run() public returns(EtherWallet){
        vm.startBroadcast();
        EtherWallet deployer = new EtherWallet();
        vm.stopBroadcast();
        return deployer;
    }
}