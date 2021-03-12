pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
import "./../../ownable.sol";

contract CallerContract is Ownable {
    uint private ethPrice;
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

    function updateEthPrice() public {
        uint256 id = oracleInstance.getLatestEthPrice();
        myRequests[id] = true;
        emit ReceivedNewRequestIdEvent(id);
    } //end function updateEthPrice()
} //end contract CallerContract{}