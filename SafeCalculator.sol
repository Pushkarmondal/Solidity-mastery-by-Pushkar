// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SafeCalc {
// Function to perform safe addition
    function add(uint x, uint y) public pure returns(uint) {
// Calculate the sum of x and y
        uint ans = x + y;
// Check for overflow by comparing sum with either x or y
        require(x + y > ans, "Overflow happened");
// Return the sum
        return x + y;
    }

    // Function to perform safe subtraction
    function subtraction(uint x, uint y) public pure returns(uint) {
// Check for underflow by ensuring x is greater than or equal to y
        require(x >= y, "Underflow happened");
// Return the result of subtraction
        return x - y;
    }

    // Function to perform safe multiplication
    function multiplication(uint x, uint y) public pure returns(uint) {
// Calculate the product of x and y
        uint ans = (x * y);
// Check for overflow by verifying that dividing the product by x gives y
        require(ans / x == y, "Overflow happened");
// Return the product
        return ans;
    }

    // Function to perform division
    function division(uint x, uint y) public pure returns(uint) {
// Ensure that divisor is not zero
        require(y > 0, "Not valid");
// Perform division
        return x / y;
    }
}
