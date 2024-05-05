// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Company {
    struct Employee{
        uint256 salary;
        string depertment;
    }

    mapping (string => mapping (address => Employee)) company;

    function setDetails(string memory department, address _address) public view returns (Employee memory) {
        Employee memory employee = company[department][_address];
        require(employee.salary >= 0, "Employee already exist");
        return employee;
    }

    function getDetails(string memory department, address _address, uint256 salary, string memory name) external {
        require(_address != address(0), "Invalid address");
        require(company[department][_address].salary == 0, "Employee already exist");
        company[department][_address] = Employee(salary, name);
    }
}
