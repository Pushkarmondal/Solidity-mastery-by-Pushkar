// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; 

interface calculator {
    function add(uint a, uint b)external returns(uint);
    function subtract(uint a, uint b)external returns(uint);
    function multiplication(uint a, uint b)external returns(uint);
    function division(uint a, uint b)external returns(uint);
}

contract calc is calculator {
    function add(uint a, uint b) public pure returns(uint) {
        uint c = a + b;
        return c;
    }

    function subtract(uint a, uint b) public pure returns(uint) {
        require(a >= b, "invalid numbers");
        return (a - b);
    }
    
    function multiplication(uint a, uint b) public pure returns(uint) {
        return (a * b);
    }

    function division(uint a, uint b) public pure returns(uint) {
        require(a >= 0, "Invalid numbers");
        return (a / b);
    }
}
