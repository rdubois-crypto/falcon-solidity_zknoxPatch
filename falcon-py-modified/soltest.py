from ntt import *
import falcon
from falcon import *
from random import randint, random, gauss, uniform
n = 512
f = [randint(0, q - 1) for j in range(n)]

ntt_f = ntt(f)

n = 8
f1 = [randint(0, q - 1) for j in range(n)]
f2 = [randint(0, q - 1) for j in range(n)]

ntt_f1 = ntt(f1)
ntt_f2 = ntt(f2)
merged_ntt_f = merge_ntt([ntt_f1, ntt_f2])


n = 8
f = [randint(0, q - 1) for j in range(n)]
f = [7967, 11836, 7356, 6533, 11162, 3606, 8926, 6376]
ntt_f = ntt(f)

a = [randint(0, q - 1) for j in range(n)]
b = [randint(0, q - 1) for j in range(n)]
mul = mul_zq(a, b)

sub = sub_zq(a, b)

sk = falcon.SecretKey(512)
pub = falcon.PublicKey(sk)
sig = sk.sign(b"falcon in sol now?")
salt = sig[HEAD_LEN:HEAD_LEN + SALT_LEN]
enc_s = sig[HEAD_LEN + SALT_LEN:]
s1 = decompress(enc_s, sk.sig_bytelen - HEAD_LEN - SALT_LEN, sk.n)

sk.hash_to_point(
    0xc5b40c2770a332209f89d5c4f110360ee88b310f55c6c70af501ee383a7ce472dbbd3effa056ac97, b"falcon in sol now?")
