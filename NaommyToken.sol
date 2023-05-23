// SPDX-License-Identifier: NONE
pragma solidity ^0.8.0;

contract NaommyToken {
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    address public owner;

    string public name = "Naommy Token";
    string public symbol = "NMY";
    uint8 public decimals = 8;

    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    constructor() {
        totalSupply = 1_000_000_000 * 10 ** decimals; // 1 billion
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function changeOwner(address _newOwner) public {
        require(msg.sender == owner, "Only owner can change owner");
        owner = _newOwner;
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Not enough balance");
        require(_to != address(0), "Cannot send to zero address");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(allowance[_from][msg.sender] >= _value, "Not enough allowance");
        require(balanceOf[_from] >= _value, "Not enough balance");
        require(_to != address(0), "Cannot send to zero address");
        require(_from != address(0), "Cannot send from zero address");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        require(_spender != address(0), "Cannot approve zero address");
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }
}
