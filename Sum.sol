// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Sum {
    uint firstNumber;
    uint secondNumber;

    function setNumers(uint _x, uint _y) public {
        firstNumber = _x;
        secondNumber = _y;
    }

    function sum() public view returns (uint) {
        return firstNumber + secondNumber;
    }
}
