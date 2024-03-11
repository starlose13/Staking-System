// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {StakingContract} from "../src/StakingContract.sol";
import {MockERC20} from "../src/Mocks.sol";


contract StakingTest is Test , MockERC20 {
    StakingContract public staking;
    MockERC20 public token;
    uint public constant AMOUNT = 1e10;
    function setUp() public {
        staking = new StakingContract();
        token = new MockERC20();        
    }
    function testStakeFuzz(uint32 amount) public {
        token.approve(address(staking),amount);
        bool success = staking.stake(amount, address(token));
        uint value = token.balanceOf(address(staking));
        assertEq(value,amount);
        assertTrue(success);
    }
}
