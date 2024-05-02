// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract lilEns{

    mapping (string => address) name;

    function register(string memory _name) public payable {
        require(name[_name] == address(0), "alreadyTaken");
        name[_name] = msg.sender;
    }

    function update(string memory _name, address addr) public payable {
        require(msg.sender != name[_name], "Unauthorized");
        name[_name] = addr;
    }

    function get(string memory _name) public view returns(address) {
        return name[_name];
    }

}
