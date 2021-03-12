pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
import "./../../ownable.sol";

contract CallerContract is Ownable {
    uint private ethPrice;
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;
    event newOracleAddressEvent(address oracleAddress);
    event ReceivedNewRequestIdEvent(uint256 id);
    event PriceUpdatedEvent(uint ethPrice, uint id);

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

    function callback(uint256 _ethPrice, uint256 _id) public {
        require(myRequests[id] == true, "The request is not in my pending list.");
      } //end function callback()
} //end contract CallerContract{}