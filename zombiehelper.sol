pragma solidity >=0.5.0 <0.6.0;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {
    modifier aboveLevel(uint _level, uint _zombieId) {
        require(zombies[_zombieId].level >= _level);
        _;
    } //end modifier aboveLevel()

    function changeName(uint _zombieId, string _newName) external aboveLevel(_level, _zombieId) {
    
    } //end function changeName()
} //end contract ZombieHelper{}
