// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract ContractTest is Test {
    Counter public myContract;

    // function testExample() public {
    //     assertTrue(true);
    // }

    function setUp() public {
        myContract = new Counter(10);
    }

    function testGetCount() public {
        int value = myContract.getCount();
        assertEq(value, 10);
        emit log_named_int("The value is", value); //When you want to print
    }

    function testIncrementCounter() public {
        myContract.incrementCounter();
        int value = myContract.getCount();
        assertEq(value, 11);
        emit log_named_int("The value is", value);
    }
}
