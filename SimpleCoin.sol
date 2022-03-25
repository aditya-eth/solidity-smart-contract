// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }
    // function to mint coin fo ourselves
    function mint(address receiver, uint amount) public {
        // minter should be owner of the contract
        require(msg.sender == minter );
        require(amount < 1e60); //max amount to be minted
        balances[receiver] += amount;
    }
    // function to send any amount of coin from address to another 
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient Balance");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
} 
