pragma solidity ^0.4.16;

contract Map {
	mapping(address => uint) values;

	function pay(address addr) payable public {
		values[addr] = msg.value;
	}

	function get_value(address addr) public view returns(uint) {
		return values[addr];
	}
}


