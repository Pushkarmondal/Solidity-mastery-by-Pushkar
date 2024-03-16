// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IERC20 {
//Total supply of nft/coins:
    function totalSupply() external view returns(uint);

//Balance of various accounts:
    function balanceOf(address account) external view returns(uint);

//This function Transfer tokens receipent address and amount of tokens:
    function transfer(address receipent, uint amount) external returns(bool);

//The allowance function tells you how many tokens one person (the "owner") has allowed another person (the "spender") to spend on their behalf. 
    function allowance(address owner, address spender)
             external view returns(uint);

//This function approves the spender that how much he can spend on behalf of owner:   
    function approve(address spender, uint amount)
              external returns(bool);

//This function is use for transfer tokens by using sender address and receipent address and also total amount:  
    function transferFrom(
        address sender,
        address receipent,
        uint amount
    ) external returns(bool);

//This event will called when some transfer happened:
    event Transfer(address indexed from, address indexed to, uint amount);

//This event will called when some approval from owner side happened:
    event Approval(address indexed owner, address indexed spender, uint amount);
}

contract ERC20 is IERC20 {
    uint public totalSupply; 
    mapping (address => uint) public balanceOf;
    mapping(address => mapping (address => uint)) public allowance;
    string public name = "Test";
    string public symbol = "TEST";
    uint8 public decimals = 18;

    function transfer(address receipent, uint amount) external returns(bool){
        balanceOf[msg.sender] -= amount;
        balanceOf[receipent] += amount;
        emit Transfer(msg.sender, receipent, amount);
        return true;
    }

    function approve(address spender, uint amount)
             external returns(bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;

    }
    
    function transferFrom(
        address sender,
        address receipent,
        uint amount
    ) external returns(bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[receipent] += amount;
        emit Transfer(sender, receipent, amount);
        return true;
    }

    function _mint(address to, uint amount) internal {
        balanceOf[to] += amount;
        totalSupply += amount;
        emit Transfer(address(0), to, amount);
    }

    function _burn(address from, uint amount) internal {
        balanceOf[from] -= amount;
        totalSupply -= amount;
        emit Transfer(from, address(0), amount);
    }

    function mint(address to, uint amount) external {
        _mint(to, amount);
    }

    function burn(address from, uint amount) external {
        _burn(from, amount);
    }
}
