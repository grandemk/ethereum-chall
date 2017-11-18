#!/bin/bash

set -eu

mine()
{
	# the networkid parameter differentiates this
	# ethereum network from the others. All the miners who
	# want to connecto this network have to
	# use the same networkid along with the same genesis block
	local -r dataDir=$1
	local -r networkId=$2
	geth --mine --rpc --networkid "$networkId" --datadir "$dataDir"
}

main()
{
	local -r dataDir="./my_block_chain"
	mkdir -p $dataDir
	local -r networkId=1999
	mine $dataDir $networkId
}

main "$@"
