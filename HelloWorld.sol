// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message = "Hello World";

    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
