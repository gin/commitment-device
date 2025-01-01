// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {CommitmentDevice} from "src/CommitmentDevice.sol";

contract CounterTest is Test {
    CommitmentDevice public c;

    function setUp() public {
        c = new CommitmentDevice();
        // c.setNumber(0);
    }

    function test_Increment() public {
        c.increment();
        assertEq(c.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        c.setNumber(x);
        assertEq(c.number(), x);
    }

    function test_AddCommitment() public {
        c.addCommitment("commitment1");
        assertEq(c.numberOfCommitments(), 1);
    }

    function test_EditCommitment() public {
        c.addCommitment("commitment1");
        c.editCommitment(0, "commitment2");
        assertEq(c.numberOfCommitments(), 1);
        assertEq(c.commitments(0), "commitment2");
    }

    function test_RemoveCommitment() public {
        c.addCommitment("commitment1");
        c.removeCommitment(0);
        assertEq(c.numberOfCommitments(), 0);
    }
}
