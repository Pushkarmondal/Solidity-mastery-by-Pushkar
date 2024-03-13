// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Varify {
//In this structure, I have created some lists like the name of the student, ID, address, and proctor details:
    struct Student {
        string name;
        uint id;
        string addressofStudent;
        string proctor;
    }

//This struct I have used for subjects of curriculums of subjects:
    struct Subjects {
        string[] subjects;
    }
    Subjects curriculums;

//array of subjects:
    string[] subjects;

//mapping through Student struct:
    mapping(uint => Student)  students;

//This is address of owner(administrator):
    address owner;

    constructor() {
        owner = msg.sender;
    }
//Only administrator can call this:
    modifier onlyAuthority() {
        require(owner == msg.sender, "Only For College Administrator");
        _;
    }

//In this function, we store student details:
    function StudentsDetails(string memory _name, uint _id, string memory _address, string memory _proctor) public onlyAuthority{
        students[_id] = (Student(_name, _id, _address, _proctor));
    }

//This function is used for calculating the attendance of students:
    function calculateAttandence(uint _totalClass, uint _attend) public pure returns(uint) {
        return ((_attend * 100) / _totalClass);
    }

//This is basically when a student enters a password and confirms it on the login page. If the password matches, it returns true, otherwise it will return false:
    function Login(uint _password, uint _confirmPassword) public pure {
        require(_password == _confirmPassword, "Invalid Password");
    }

//In this function only College Administrator can add subjects:
    function initializeSubjects(string[] memory _subjects) public onlyAuthority{
        for (uint i = 0; i <= subjects.length; i++) 
        {
            curriculums.subjects.push(_subjects[i]);
        }
    }
}