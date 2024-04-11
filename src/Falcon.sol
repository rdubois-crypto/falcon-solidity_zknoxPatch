// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

library Falcon {
    uint256 n = 512;
    uint256 sigBound = 34034726;
    uint256 sigBytesLen = 666;
    uint256 q = 12289;

    struct PublicKey {
        int256[512] h;
    }
    struct Signature {
        bytes salt;
        int256[512] s1;
    }

    function hashToPoint(
        bytes memory msgHash,
        bytes memory salt
    ) public pure returns (int256[512] memory) {
        // TODO: wait for shake256 from dilithium repo
    }

    function verify(
        bytes msgs,
        Signature memory signature
    ) public pure returns (address) {
        hashed = self.hash_to_point(msgs, signature.salt);
    }
}
