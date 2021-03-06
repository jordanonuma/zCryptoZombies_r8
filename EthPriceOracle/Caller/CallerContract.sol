pragma solidity 0.5.0;

contract CallerContract {
    address private oracleAddress;

    function setOracleInstanceAddress(address _oracleInstanceAddres) public {
        oracleAddress = _oracleInstanceAddress;
    } //end function setOracleInstanceAddress()
} //end contract CallerContract{}