// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Falcon} from "../src/Falcon.sol";

contract FalconTest is Test {
    Falcon public falcon;

    function setUp() public {
        falcon = new Falcon();
    }
}
