// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

library calculator {
   function add(uint256 x, uint256 y) public pure returns(uint256) {
// Calculate the sum of x and y
        // uint256 ans = x + y;
// Check for overflow by comparing sum with either x or y
        require(x + y > x, "Overflow happened");
// Return the sum
        return x + y;
    }

    // Function to perform safe subtraction
    function subtraction(uint256 x, uint256 y) public pure returns(uint256) {
// Check for underflow by ensuring x is greater than or equal to y
        require(x >= y, "Underflow happened");
// Return the result of subtraction
        return x - y;
    }

    // Function to perform safe multiplication
    function multiplication(uint256 x, uint256 y) public pure returns(uint256) {
// Calculate the product of x and y
        uint256 ans = (x * y);
// Return the product
        return ans;
    }

    // Function to perform division
    function division(uint256 x, uint256 y) public pure returns(uint256) {
// Ensure that divisor is not zero
        require(y > 0, "Not valid");
// Perform division
        return x / y;
    }
}

contract inheritLibrary {
    function add(uint256 x, uint256 y) external pure returns(uint256) {
        return calculator.add(x, y);
    }
    function subtract(uint256 x, uint256 y) external pure returns(uint256) {
        return calculator.subtraction(x, y);
    }
    function multiplication(uint256 x, uint256 y) external pure returns(uint256) {
        return calculator.multiplication(x, y);
    }
    function division(uint256 x, uint256 y) external pure returns(uint256) {
        return calculator.division(x, y);
    }
}
