// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract wallet{
    address public depositer;
    uint public amount;

    constructor() {
        depositer = msg.sender;
    }

    mapping (address => uint256) public totalmoney;

    //we can send message in this function:)
    function deposit() public payable{
        // amount = money;
        require(msg.value > 0, "please send atleat minimum amount");
        totalmoney[msg.sender] += msg.value;
        amount += msg.value;
    }

    //Withdrwal money:
    function withdrawl(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        require(totalmoney[msg.sender] >= _amount, "Insufficient balance");
        totalmoney[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    //transfer fund:
    function transfer(address receipant, uint _amount) public {
        require(receipant != address(0), "Invalid address");
        require(totalmoney[msg.sender] >= _amount, "Insufficient balance");
        totalmoney[msg.sender] -= _amount;
        totalmoney[receipant] += _amount;
    }

    //to get address remaining balance:
    function _balances()public view returns (uint256) {
        return totalmoney[msg.sender];
    }
} 