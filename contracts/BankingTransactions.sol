// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BankingTransactions {
    mapping(address => uint) public balances;

    // Block timestamp to events
    event Deposit(address indexed account, uint amount, uint timestamp);
    event Withdraw(address indexed account, uint amount, uint timestamp);
    event Transfer(address indexed from, address indexed to, uint amount, uint timestamp);

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance.");
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
        emit Withdraw(msg.sender, _amount, block.timestamp);
    }

    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance.");
        require(_to != address(0), "Invalid recipient address.");
        
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount, block.timestamp);
    }
}

