mapInfo = { code : "0x6060604052341561000f57600080fd5b6101868061001e6000396000f30060606040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680630c11dedd14610051578063f81f41ec1461007f575b600080fd5b61007d600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506100cc565b005b341561008a57600080fd5b6100b6600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610112565b6040518082815260200191505060405180910390f35b346000808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000208190555050565b60008060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205490509190505600a165627a7a72305820ce673d77f9219c103bc6333ab28e93d033299c6cb8a785de307897baa063a0010029", abi:[{"constant":false,"inputs":[{"name":"addr","type":"address"}],"name":"pay","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":true,"inputs":[{"name":"addr","type":"address"}],"name":"get_value","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]}
personal.unlockAccount(eth.coinbase, "")
mapContract = eth.contract(mapInfo.abi)

var map = mapContract.new({from:eth.coinbase, data:mapInfo.code, gas:300000})

miner.start(8)
admin.sleepBlocks(8)
miner.stop()

tx = eth.getTransactionReceipt(map.transactionHash)

map = mapContract.at(tx.contractAddress)
