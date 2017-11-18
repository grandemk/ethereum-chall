#!/bin/bash

set -eu

create_account()
{
	local -r dataDir=$1
	geth account new --datadir "$dataDir"
}

main()
{
	local -r dataDir="./my_block_chain"
	mkdir -p $dataDir
	create_account $dataDir
}

main "$@"

