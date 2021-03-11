pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
import "./../../ownable.sol";

contract CallerContract is Ownable {
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;
    event newOracleAddressEvent(address oracleAddress);
    event ReceivedNewRequestIdEvent(uint256 id);

    mapping(uint256=>bool) myRequests;

    function setOracleInstanceAddress(address _oracleInstanceAddres) public onlyOwner {
        oracleAddress = _oracleInstanceAddress;
        oracleInstance = EthPriceOracleInterface(oracleAddress);
        emit newOracleAddressEvent(oracleAddress);
    } //end function setOracleInstanceAddress()
} //end contract CallerContract{}