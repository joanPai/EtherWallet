// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {EtherWallet} from "src/EtherWallet.sol";

contract DeployEtherWallet is Script {
    function run() public returns (EtherWallet) {
        vm.startBroadcast();
        EtherWallet deployer = new EtherWallet();
        vm.stopBroadcast();
        console.log("Deployed EtherWallet at:", address(deployer));
        return deployer;
    }
}
