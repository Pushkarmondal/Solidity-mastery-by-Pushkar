// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract bank {

    struct BankDetails {
        address owner;
        uint256 balance;
        uint256 time;
    }

    mapping (address => BankDetails) BankName;
    event balanceAdded(address owner, uint256 balance, uint256 timestamp);
    event withdrawlDone(address owner, uint256 balance, uint256 timestamp);

    function addedBank() public payable {
        BankName[msg.sender].owner = msg.sender;
        BankName[msg.sender].balance = msg.value;
        BankName[msg.sender].time = block.timestamp;
        emit balanceAdded(msg.sender, msg.value, block.timestamp);
    }

    function deposit() public payable {
        BankName[msg.sender].balance += msg.value;
        emit balanceAdded(msg.sender, msg.value, block.timestamp);
    }

    function withdrawl() public payable {
        payable (msg.sender).transfer(BankName[msg.sender].balance);
        BankName[msg.sender].balance = 0;
        emit withdrawlDone(msg.sender, BankName[msg.sender].balance, block.timestamp);
    }

    function getValue(address owner) public view returns(address ,uint256, uint256) {
        return (BankName[owner].owner, BankName[owner].balance, BankName[owner].time);
    }
}
