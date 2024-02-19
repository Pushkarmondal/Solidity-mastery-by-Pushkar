//From now I will practice solidity till last day of feb.
//@author - Pushkar

// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract day1 {
    //function in solidity
    function x() public pure returns(uint){
        return 1;
    }
}


//function outside the contract
function helper(uint x) pure returns(uint) {
    return x * 2;
}


// function modifier
contract modifier1 {
    address public seller;

    function set (address _seller) public {
        seller = _seller;
    }

    function get() public view returns(address) {
        return seller;
    }

    modifier not() {
        require(msg.sender == seller, "Not a seller");
        _;
    }
    function modifi() public view not returns(address) {
        return seller;
    }
}

//event in solidity

contract event1{
    event payment(address indexed from, address indexed to, uint amount);

    function receive1(address _to, uint _amount) public{
        emit payment(msg.sender, _to, _amount);
    }
}

//error in solidity
error NotEnoughFunds(uint requested, uint available);

contract Token {
    mapping(address => uint) balances;
    function transfer(address to, uint amount) public {
        uint balance = balances[msg.sender];
        if (balance < amount)
            revert NotEnoughFunds(amount, balance);
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}

//structs in solidity
contract str {
    struct voter{
        uint votecount;
        address voter;
        address winner;
        address looser;
    }
}

//enum in solidity
//enum can't be grater than 4
contract enum1 {
    enum acc {
        pending,     // 0
        acceptance  // 1
    }
}