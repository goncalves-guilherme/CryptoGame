pragma solidity >=0.4.22 <0.9.0;

contract Test {
    address private owner;

    string public name = "Test";

    // Events
    event SetNameEvent(string evPram);

    constructor() public
    {
        owner = msg.sender;
    }

    function getName() external view returns (string memory) {
        return name;
    }

    function setName(string memory newName) public onlyOwner{
        name = newName;
        emit SetNameEvent(newName);
    }   

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }
}