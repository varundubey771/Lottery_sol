pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;

    function Lottery() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > 10000000000000000);
        players.push((msg.sender));
    }

    function random() public view returns (uint256) {
        uint256 source = block.timestamp + block.difficulty;
        return uint256(keccak256(abi.encodePacked(source)));
    }

    function pickWinner() public {
        require(msg.sender == manager);
        uint256 rand = random();
        uint256 n = players.length;
        uint256 k = rand % n;
        players[k].transfer(address(this).balance);
        players = new address[](0); //()initial size 0 dynamic array
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}
