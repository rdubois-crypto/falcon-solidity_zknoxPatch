// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

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
            res[i] = uint16(uint256(x) >> (i * 16));
        }
        return res;
    }

    function hashToPoint(
        bytes memory msgHash,
        bytes memory salt
    ) public pure returns (int256[512] memory) {
        // TODO: wait for shake256 from dilithium repo
    }

    function verify(
        bytes memory msgs,
        Signature memory signature
    ) public pure returns (address) {
        int256[512] memory hashed = hashToPoint(msgs, signature.salt);
    }
}
