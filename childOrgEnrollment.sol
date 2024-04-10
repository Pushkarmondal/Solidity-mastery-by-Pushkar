// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Childorg {
    struct org_info {
        string name;
        uint age;
        string department;
        string childOrgName;
    }

    mapping(address => org_info) orgs;

    function enrollment(string memory _name, uint _age, string memory _department, string memory _childOrgName) virtual external{
        orgs[msg.sender] = org_info(_name, _age, _department, _childOrgName);
    }

    function getOrgInfo(address _addr) public view returns (string memory, uint, string memory, string memory) {
        org_info memory info = orgs[_addr];
        return (info.name, info.age, info.department, info.childOrgName);
    }
}

contract ChildrenOrgs is Childorg {
    function enrollment(string memory _name, uint _age, string memory _department, string memory _childOrgName) override public {
        orgs[msg.sender] = org_info(_name, _age, _department, _childOrgName);
    }
}
