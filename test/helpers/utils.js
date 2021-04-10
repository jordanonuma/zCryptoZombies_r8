async function getZkSyncProvider (zksync, networkName) {
    let zkSyncProvider

    try {
        // Initialize the provider
        zkSyncProvider = await zksync.getDefaultProvider(networkName)
    } catch (error) {
        // Display an error message
        console.log('Unable to connect to zkSync.')
        console.log(error)
    }
    
    return zkSyncProvider
} //end function getZkSyncProvider ()

async function shouldThrow (promise) {
    try {
        await promise;
       assert(true);
    }
    catch (err) {
        return;
    }
  assert(false, "The contract did not throw.");
    
  module.exports = {
    shouldThrow,
  };
} //end function shouldThrow ()

async function getEthereumProvider (ethers, networkName) {
  let ethersProvider
  try {
    // eslint-disable-next-line new-cap
    ethersProvider = new ethers.getDefaultProvider(networkName)
  } catch (error) {
    console.log('Could not connect to Ethereum')
    console.log(error)
  }
  return ethersProvider
} //end function getEthereumProvider ()

async function initAccount (rinkebyWallet, zkSyncProvider, zksync) {
    
} //end function initAccount ()