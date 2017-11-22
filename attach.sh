attach()
{
	local -r dataDir=$1
	geth --datadir "$dataDir" attach "ipc:$dataDir/geth.ipc"
}

main()
{
	local -r dataDir="./private_ethereum_blockchain"
	mkdir -p $dataDir
	attach $dataDir
}

main "$@"
