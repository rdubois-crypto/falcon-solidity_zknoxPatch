from Crypto.Hash import keccak
from eth_abi.packed import encode_packed


class FakeShake:
    def __init__(self) -> None:
        self.input = []
        self.last = None
        self.tmp = None

    def update(self, data):
        if self.last is not None:
            raise ValueError('FakeShake.update() called after digest()')
        self.input.append(data)

    def read(self, bit):
        if self.last is None:
            keccak_hash = keccak.new(digest_bits=256)
            keccak_hash.update(encode_packed(
                ["bytes"] * len(self.input), self.input))
            self.last = keccak_hash.digest()
            self.tmp = keccak_hash.hexdigest()

        while len(self.tmp) < bit:
            keccak_hash = keccak.new(digest_bits=256)
            keccak_hash.update(self.last)
            self.last = keccak_hash.digest()
            self.tmp += keccak_hash.hexdigest()

        buff = self.tmp[:bit]
        self.tmp = self.tmp[bit:]
        return buff
