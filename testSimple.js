personal.unlockAccount(eth.coinbase, "")
var win_event = bountySimple.Win()
var wong_event = bountySimple.Wong()

win_event.watch(function(error, result) {
	if(error) {
		console.log("win error")
		console.log(error);
		return;
	}

	console.log("Win");
});

wong_event.watch(function(error, result) {
	if(error) {
		console.log("wong error");
		console.log(error);
		return;
	}
	console.log("Wong coming from address:");
	console.log(result.address);
	console.log("with data:");
	console.log(result.args._from);
});

bountySimple.win.call()
bountySimple.win.sendTransaction({from: eth.coinbase, gas: 300000})

console.log("start mining")
miner.start(8)
admin.sleepBlocks(8)
miner.stop()
console.log("finished mining")
