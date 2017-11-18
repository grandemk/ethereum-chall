#!/bin/bash

set -eu

create_genesis_block()
{
# example config for genesis block
#{
#	"config" : {
#		"chainId" : 666, // some id not taken b official keychains
#		"homesteadBlock" : 0, // release of etc used
#		"eip155Block" : 0, // supports eip155
#		"eip158Block" : 0 // supports eip158
#	},
#       // a value corresponding to the difficulty level applied during the nonce discovery of this block.
#       //
#	"difficulty" : "0x400",
#       // gas is the internal pricing for running a transaction.
#       // each instruction sent to the EVM to process a transaction costs a
#       // specific amount of gas. gasLimit parameter in the block specifies
#       // the aggregated gasLimit from all the transactions included in the
#       // block
#	"gasLimit" : "0x2100000",
#	"alloc" : {
#               // permits to pre-allocate ehther to one or more accounts
#               // from the genesis block, the pre-allocation is done to the
#               // account we created at the begining
#		"<account>": {"balance" : "0x133700000000000000000"}
#	}
#}
	local -r dataDir=$1
	local -r pathGenesisBlock=$2
	# datadir: data directory for the databases and keystore
	# init: bootstrap and initialize a new genesis block using the provided json file.
	geth -datadir "$dataDir" init $pathGenesisBlock
}

main()
{
	local -r dataDir="./my_block_chain"
	mkdir -p $dataDir
	local -r genesisBlock="genesis.json"
	create_genesis_block $dataDir $genesisBlock
}

main "$@"
