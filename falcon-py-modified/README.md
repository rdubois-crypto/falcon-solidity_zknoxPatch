# this folder is a modified version of [falcon.py](https://github.com/tprest/falcon.py)
### This version is a EVM friendly Falcon signature scheme.
list of modification.
- change shake256 to Keccak loop - we trade slightly slower signing in local with cheaper on-chain verification cost.