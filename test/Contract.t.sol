// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract ContractTest is Test {
    Counter public myContract;

    function testExample() public {
        assertTrue(true);        
    }
}
