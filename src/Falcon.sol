// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;
import {Test, console} from "forge-std/Test.sol";

library Falcon {
    uint256 constant n = 512;
    uint256 constant sigBound = 34034726;
    uint256 constant sigBytesLen = 666;
    uint256 constant q = 12289;

    struct PublicKey {
        int256[512] h;
    }
    struct Signature {
        bytes salt;
        int256[512] s1;
    }

    function splitToHex(bytes32 x) public pure returns (uint16[16] memory) {
        uint16[16] memory res;
        for (uint i = 0; i < 16; i++) {
            res[i] = uint16(uint256(x) >> ((15 - i) * 16));
        }
        return res;
    }

    function hashToPoint(
        bytes memory salt,
        bytes memory msgHash
    ) public view returns (uint256[512] memory hashed) {
        uint i = 0;
        uint j = 0;
        bytes32 tmp = keccak256(abi.encodePacked(salt, msgHash));
        console.logBytes32(tmp);
        uint16[16] memory sample = splitToHex(tmp);
        uint k = (1 << 16) / q;
        uint kq = k * q;
        while (i < n) {
            if (j == 16) {
                tmp = keccak256(abi.encodePacked(tmp));
                sample = splitToHex(tmp);
                j = 0;
            }
            console.logUint(sample[j]);
            if (sample[j] < kq) {
                // console.logUint(sample[j]);
                hashed[i] = sample[j] % q;
                i++;
            }
            j++;
        }
        return hashed;
    }

    function verify(
        bytes memory msgs,
        Signature memory signature
    ) public view returns (address) {
        uint256[512] memory hashed = hashToPoint(msgs, signature.salt);
    }
}
