pragma solidity >=0.5.0 <0.6.0;
import "./zombiefactory.sol";

contract KittyInterface {

    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    ); //end external from cryptokitty contract: function getKitty()

} //end contract KittyInterface{}

contract ZombieFeeding is ZombieFactory {
    
    address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    KittyInterface kittyContract = KittyInterface(ckAddress);

    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];

        _targetDna = _targetDna % dnaModulus; //This will take the last x digits of 10**x. For example MOD(12345,10^4) yields 2345.
        uint newDna = (myZombie.dna + _targetDna) / 2;
        _createZombie("NoName", newDna);
    } //end function feedAndMultiply()

    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        uint kittyDna;
    } //end function feedOnKitty()

} //end contract ZombieFeeding{}