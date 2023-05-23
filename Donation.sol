// SPDX-License-Identifier: NONE
pragma solidity ^0.8.0;

contract Donation {
    address public owner = msg.sender;

    receive() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(msg.sender).transfer(address(this).balance);
    }
}
