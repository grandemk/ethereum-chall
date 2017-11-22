pragma solidity ^0.4.16;

contract sha {
	function hash(bytes32 str) pure public returns(bytes32) {
		bytes32 hash256 = sha256(str);
		return hash256;
	}
}
