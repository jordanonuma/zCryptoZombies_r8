pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";

contract CallerContract {
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;

    function setOracleInstanceAddress(address _oracleInstanceAddres) public {
        oracleAddress = _oracleInstanceAddress;
    } //end function setOracleInstanceAddress()
} //end contract CallerContract{}