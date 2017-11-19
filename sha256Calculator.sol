pragma solidity ^0.4.16;

contract sha256Calculator {
	function sha(bytes32 str) public returns(bytes32) {
		bytes32 hash = sha256(str);
		return hash;
	}
}
