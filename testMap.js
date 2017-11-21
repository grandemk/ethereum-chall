tx = Map.add_bounty.sendTransaction(100000, "test", {from:eth.coinbase, value:90000})

miner.start(8)
admin.sleepBlocks(2)
miner.stop()

console.log("tx:")
console.log(tx)
inspect(eth.getTransactionReceipt(tx))
console.log("chall:")
console.log(Map.get_chall(eth.coinbase));
console.log("reward:")
console.log(Map.get_reward(eth.coinbase));
