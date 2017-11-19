pragma solidity ^0.4.16;

contract BountySimple {

	event Win();
	event Wong(address indexed _from);

	function win() public returns(string) {
		if(this.balance == 0) {
			Win();
		}
		Wong(msg.sender);
		return "Win";
	}
}
