// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract ToDo {
    // mapping to store todos for different addresses
    mapping(address => string[]) public todos;

    // addTodo function 
    function addTodo( string memory _todo) public {
        // add todo the array of todos for this  individual address 
        require(bytes(_todo).length > 0);
        todos[msg.sender].push(_todo);
    }

    // getTodos function 
    function getTodos() public view returns (string[] memory) {
        return todos[msg.sender];
    }

    // getTodosLength function 
    function getTodosLength() public view returns (uint) {
        return todos[msg.sender].length;
    }

    // delTodo funtion 
    function delTodo(uint _idx) public {
        require(_idx < todos[msg.sender].length);
        todos[msg.sender][_idx] = todos[msg.sender][getTodosLength() - 1];
        todos[msg.sender].pop();
    }
}
