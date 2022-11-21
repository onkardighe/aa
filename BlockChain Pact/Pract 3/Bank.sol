pragma solidity ^0.8.17;

contract Bank {
    
    uint256 public balance;
    
    constructor () public {
        balance = 0;
    }
    
    function getBalance() public view returns (uint256) {
        return balance;
    }
    
    function withdrawal( uint256 amount ) public  {
        require ( balance >= amount, "Insufficient Balance");
        balance = balance - amount;
    }
    
    function deposit (uint256 amount) public {
        balance = balance + amount;
    }
}