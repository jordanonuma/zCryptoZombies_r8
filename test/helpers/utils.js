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
      console.log('Could not connect to Rinkeby.')
      console.log(error)
    }
    return ethersProvider
} //end function getEthereumProvider ()

async function initAccount (rinkebyWallet, zkSyncProvider, zksync) {
    const zkSyncWallet = await zksync.Wallet.fromEthSigner(rinkebyWallet, zkSyncProvider)
    return zkSyncWallet
} //end function initAccount ()

async function registerAccount (wallet) {
    console.log(`Registering the ${wallet.address()} account on zkSync`)
    if (!await wallet.isSigningKeySet()) {
      if (await wallet.getAccountId() === undefined) {
        throw new Error('Unknown account')
      } //end if ()
      const changePubKey = await wallet.setSigningKey()
      await changePubKey.awaitReceipt()
    } //end if ()
} //end function registerAccount ()

async function depositToZkSync (zkSyncWallet, token, amountToDeposit, ethers) {
    const deposit = await zkSyncWallet.depositToSyncFromEthereum({
        depositTo: zkSyncWallet.address(),
        token: token,
        amount: ethers.utils.parseEther(amountToDeposit)
    }) //end depositToSyncFromEthereum ()
    try {
       await deposit.awaitReceipt()
    } catch (error) {
        console.log('Error while awaiting confirmation from the zkSync operators.')
        console.log(error)
    } //end try-catch()
} //end function depositToZkSync ()