pragma solidity ^0.4.16;

contract Map {
	mapping(address => uint) rewards;
	mapping(address => bytes32) challs;
	mapping(address => bool) solved;

	function add_bounty(uint reward, bytes32 chall) payable public {
		rewards[msg.sender] = reward;
		solved[msg.sender] = false;
		challs[msg.sender] = chall;
	}

	function remove_bounty() payable public {
		rewards[msg.sender] = 0;
	//	challs[msg.sender] = bytes32(0);
	//	solved[msg.sender] = false;
	}

/*
	function get_solved(address chall) public view returns(bool) {
		return solved[chall];
	}
	*/

	function get_reward(address addr) public view returns(uint) {
		return rewards[addr];
	}

	function get_reward2(address addr) public view returns(uint) {
		return rewards[addr];
	}

	function get_reward3(address addr) public view returns(uint) {
		return rewards[addr];
	}

	function get_chall(address addr) public view returns(bytes32) {
		return challs[addr];
	}
}


