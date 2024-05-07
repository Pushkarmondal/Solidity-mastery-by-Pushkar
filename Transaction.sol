// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Transaction{
    address owner;
    uint256 transactionCount;

    mapping (address => uint256) balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 amount, uint256 time);

    struct TransferDetails {
        address sender;
        address receiver;
        uint256 amount;
        uint256 time;
    }

    TransferDetails[] transaction;

    constructor() {
        owner = msg.sender;
        balanceOf[msg.sender] = msg.sender.balance;
    }

    function Owner() public view returns(address) {
        return owner;
    }

    function sendMoney(address receiver, uint256 amount) public returns(bool success) {
        balanceOf[owner] -= amount;
        balanceOf[receiver] += amount;
        transactionCount += 1;

        transaction.push(TransferDetails(owner, receiver, amount, block.timestamp));

        emit Transfer(msg.sender, receiver, amount, block.timestamp);

        return true;
    } 

    function getBalance(address _address) public view returns(uint) {
        return balanceOf[_address];
    }

    function getTransaction() public view returns(TransferDetails[] memory) {
        return transaction;
    }

    function totalTransaction() public view returns(uint) {
        return transactionCount;
    }
}
