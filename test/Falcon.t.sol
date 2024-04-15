// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Falcon} from "../src/Falcon.sol";

contract FalconTest is Test {
    function testHashToPoint() public view {
        bytes memory salt = "abc";
        bytes memory msgHash = "def";
        uint256[512] memory hashed = Falcon.hashToPoint(salt, msgHash);
        console.log("----------  hashed: -------");
        for (uint i = 0; i < 512; i++) {
            console.logUint(hashed[i]);
        }
    }
}
