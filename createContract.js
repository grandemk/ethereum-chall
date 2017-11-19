// what should be executed in attach.sh to get a contract running
// and to obtain a contract with a contract address

// get abi with compile.sh
testAbi = abi
// get code with compile.sh
testCode = code
// would be good to have a wrapper to get these automatically
// as it is surprisingly difficult to find people not telling you
// to copy it there yourself (when they don't tell you to compile
// a one line string containing all the source code
// that you copied there too...)

// our account address
myAccount = eth.coinbase
// can be done interactively, but we don't care
passphrase = "" // really don't care
personal.unlockAccount(myAccount, passphrase)

testContract = eth.contract(testAbi)
// creating the new contract and sending it to the block chain
// gas value is optional (but default value might be too low)
test = testContract.new({from:myAccount, data: testCode, gas: 300000})
// now if you don't have something mining block, start one for a few seconds
miner.start(8)
// let's use polling to see if our receipt was accepted
// (you can also add a callback when doing new)
txHash = test.transactionHash
txReceipt = eth.getTransactionReceipt(txHash)
// when something is in it, we can get the contract address
testAddr = txReceipt.contractAddress
// we could also do test.address and wait for it to be not null and test will
// already be the correct object, but I want to have all useful function here

// smart contract in the blockchain
test = testContract.at(testAddr)
// do something with the contract
