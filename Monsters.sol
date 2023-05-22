// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MonsterContract {
    enum MonterType {
        Fire,
        Water,
        Rock,
        Air
    }

    struct Monster {
        string name;
        uint256 power;
        MonterType monsterType;
    }

    Monster[] private monsters;

    function createMonster(string memory _name) public {
        Monster memory newMonster;
        newMonster.name = _name;
        newMonster.power = block.number;

        if (block.number % 4 == 0) {
            newMonster.monsterType = MonterType.Fire;
        } else if (block.number % 4 == 1) {
            newMonster.monsterType = MonterType.Water;
        } else if (block.number % 4 == 2) {
            newMonster.monsterType = MonterType.Rock;
        } else {
            newMonster.monsterType = MonterType.Air;
        }
        monsters.push(newMonster);
    }

    function getMonster(uint256 index) public view returns (Monster memory) {
        return monsters[index];
    }

    function changePower(uint256 index, uint256 _newPower) public {
        Monster storage monster = monsters[index];
        monster.power = _newPower;
    }
}
