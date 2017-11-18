#!/bin/bash

set -eu

mine()
{
	# the networkid parameter differentiates this
	# ethereum network from the others. All the miners who
	# want to connecto this network have to
	# use the same networkid along with the same genesis block
	# rpc : enables an http-rpc server. walet applications can connect to this mining node over http
	# rpcaddr, rpcport: specifies the http-rpc server listning interface (defaults:localhost:8545)
	# rpcapi: API offered: default:"eth,net,web3"

	local -r dataDir=$1
	local -r networkId=$2
	geth --mine \
             --rpc \
             --networkid "$networkId"\
             --datadir "$dataDir"\
	     --rpccorsdomain "http://localhost:8000"\

}

main()
{
	local -r dataDir="./my_block_chain"
	mkdir -p $dataDir
	local -r networkId=1999
	mine $dataDir $networkId
}

main "$@"
