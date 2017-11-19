personal.unlockAccount(eth.coinbase, "")

var win_event = bounty.Win()
win_event.watch(function(error, result) {
	if(error) {
		console.log("win event error");
		console.log(error);
		return;
	}

	console.log("got Win event !");
});

bounty.win.sendTransaction({from: eth.coinbase, gas:300000})

console.log("start mining")
miner.start(8)
admin.sleepBlocks(8)
miner.stop()
console.log("finished mining")
