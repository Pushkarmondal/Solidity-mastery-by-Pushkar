// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract StudentAttandance {
    struct Student {
        string name;
        uint class;
        uint date;
    }
    address public teacher;
    uint rollno;
    mapping(uint => Student) public registered;

    modifier isTeacher{
        require(teacher == msg.sender, "Only Teacher can do this");
        _;
    }

    constructor() {
        teacher = msg.sender;
    }

    function TakenAttandance(string memory name, uint class, uint date) public isTeacher{
        require(class > 0 && class <= 12, "Invalid Class");
        Student memory std = Student(name, class, date);
        rollno++;
        registered[rollno] = std;
    }
    function Time() public view returns(uint) {
        uint time = block.timestamp;
        return time;
    }
}
