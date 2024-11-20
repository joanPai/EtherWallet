// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/vendor/forge-std/src/Script.sol";
import {StartUp} from "src/StartUp.sol";

contract DeployStartUp is Script {
    function run() public returns (StartUp) {
        {
            vm.startBroadcast();
            StartUp startUp = new StartUp();
            vm.stopBroadcast();
            return startUp;
        }
    }
}
