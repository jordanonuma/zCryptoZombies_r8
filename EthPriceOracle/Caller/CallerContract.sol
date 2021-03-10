pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
import "./../../ownable.sol";

contract CallerContract {
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;

    function setOracleInstanceAddress(address _oracleInstanceAddres) public {
        oracleAddress = _oracleInstanceAddress;
        oracleInstance = EthPriceOracleInterface(oracleAddress);
    } //end function setOracleInstanceAddress()
} //end contract CallerContract{}