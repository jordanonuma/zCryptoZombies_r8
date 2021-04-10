async function getZkSyncProvider(zksync, networkName) {
    let zkSyncProvider
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