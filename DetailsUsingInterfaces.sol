// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface DetailsUsingInterface {
    function detils(string memory name, uint age, string memory bloodGroup) external pure returns(string memory, uint, string memory);
}

contract Details is DetailsUsingInterface {
    function detils(string memory name, uint age, string memory bloodGroup) external pure returns(string memory, uint, string memory) {
        return(name, age, bloodGroup);
    }
}

