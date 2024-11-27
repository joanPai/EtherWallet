// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "lib/forge-std/src/Test.sol";
import {EtherWallet} from "src/EtherWallet.sol";
import {DeployEtherWallet} from "script/DeployEtherWallet.s.sol";

contract TestEtherWallet is Test {
    /////////
    //error//
    /////////
    error EtherWallet__CallerIsNotTheOwner();
    error EtherWallet__WithdrawFailed();
    error EtherWallet__insufficientBalance();

    ///////////////////
    //state variables//
    //////////////////
    DeployEtherWallet public deployer;
    EtherWallet public etherWallet;
    address public USER = makeAddr("user");

    //////////////////
    //test functions//
    //////////////////

    function setUp() public {
        deployer = new DeployEtherWallet();
        etherWallet = deployer.run();
        vm.deal(USER, 4 ether);
    }

    function testDeposit() public {
        vm.deal(address(this), 1 ether);
        payable(address(etherWallet)).transfer(1 ether);
        uint256 balance = etherWallet.checkBalance();
        assertEq(balance, 1 ether, "Contract should have 1 ether after deposit");
    }

    function testDeployment() public view {
        assertNotEq(address(etherWallet), address(0), "Contract was not deployed successfully");
    }

    function testBalanceAfterWithdraw() public {
        vm.deal(address(etherWallet), 2 ether);
        payable(address(etherWallet)).transfer(2 ether);
        uint256 initialBalance = etherWallet.checkBalance();
        vm.prank(address(etherWallet.owner()));
        etherWallet.withdraw(1 ether);
        assertEq(etherWallet.checkBalance(), initialBalance - 1 ether, "Balance should decrease after withdrawal");
    }

    function testZeroWithdraw() public {
        vm.deal(address(etherWallet), 1 ether);
        payable(address(etherWallet)).transfer(1 ether);
        uint256 initialBalance = address(this).balance;
        vm.prank(address(etherWallet.owner()));
        etherWallet.withdraw(0 ether);
        assertEq(address(this).balance, initialBalance, "Balance should remain the same for 0 withdraw");
    }

    function testWithdrawWhenEmpty() public {
        vm.prank(address(etherWallet.owner()));
        vm.expectRevert(EtherWallet__insufficientBalance.selector);
        etherWallet.withdraw(1 ether);
    }

    function testWithdrawMoreThanBalance() public {
        vm.deal(address(etherWallet), 1 ether);
        payable(address(etherWallet)).transfer(1 ether);
        vm.prank(address(etherWallet.owner()));
        vm.expectRevert(EtherWallet__insufficientBalance.selector);
        etherWallet.withdraw(10 ether);
    }

    function testEmptyDeposit() public {
        vm.deal(address(etherWallet), 1 ether);
        payable(address(etherWallet)).transfer(0 ether);
        assertEq(etherWallet.checkBalance(), 1 ether, "Balance should remain same after 0 ether deposit");
    }

    function testBalanceAfterWithdrawal() public {
        vm.deal(address(etherWallet), 3 ether);
        payable(address(etherWallet)).transfer(3 ether);
        uint256 initialBalance = etherWallet.checkBalance();
        vm.prank(address(etherWallet.owner()));
        etherWallet.withdraw(1 ether);
        assertEq(etherWallet.checkBalance(), initialBalance - 1 ether, "Balance should decrease after withdrawal");
    }
}
