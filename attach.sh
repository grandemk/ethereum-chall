attach()
{
	local -r dataDir=$1
	geth --datadir "$dataDir" attach "ipc:$dataDir/geth.ipc"
}

main()
{
	local -r dataDir="./my_block_chain"
	mkdir -p $dataDir
	attach $dataDir
}

main "$@"
