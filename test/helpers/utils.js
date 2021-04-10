async function getZkSyncProvider(zksync, networkName) {
    let zkSyncProvider

    try {
        // Initialize the provider
        await zksync.getDefaultProvider(networkName)
    } catch (error) {
        // Display an error message
        console.log('Unable to connect to zkSync.')
        console.log(error)
    }
} //end async function getZkSyncProvider()

async function shouldThrow(promise) {
    try {
        await promise;
       assert(true);
    }
    catch (err) {
        return;
    }
  assert(false, "The contract did not throw.");
  
  }
  
  module.exports = {
    shouldThrow,
  };