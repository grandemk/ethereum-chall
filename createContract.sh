name=${1%.*}

./compile.sh "$1"
echo "personal.unlockAccount(eth.coinbase, \"\")"
echo "${name}Contract = eth.contract(${name}Info.abi)"
echo "var ${name} = ${name}Contract.new({from:eth.coinbase, data:${name}Info.code, gas:300000})"

echo "miner.start(8)"
echo "admin.sleepBlocks(2)"
echo "miner.stop()"

echo "tx = eth.getTransactionReceipt(${name}.transactionHash)"
echo "${name} = ${name}Contract.at(tx.contractAddress)"
