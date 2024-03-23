// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract lifeCycle {
// Define an enumeration type representing different life stages
    enum Stage {
        Infant,
        Toddler,
        Child,
        TeenAger,
        Adult,
        Old
    }

    // Function to determine the life stage based on the number of months
    function getStage(uint month) public pure returns(Stage) {
// Check if the age is less than or equal to 12 months
        if(month <= 12) {
            return Stage.Infant; // Return '0'
        } 
// Check if the age is between 13 to 24 months
        else if (month > 12 && month <= 24) {
            return Stage.Toddler; // Return '1'
        } 
// Check if the age is between 25 to 144 months
        else if (month > 36 && month <= 144) {
            return Stage.Child; // Return '2'
        } 
// Check if the age is between 145 to 228 months
        else if (month > 156 && month <= 228) {
            return Stage.TeenAger; // Return '3'
        } 
// Check if the age is between 229 to 720 months
        else if (month > 240 && month <= 720) {
            return Stage.Adult; // Return '4'
        } 
// If the age exceeds 720 months
        else {
            return Stage.Old; // Return '5'
        }
    }
}
