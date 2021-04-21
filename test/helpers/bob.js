(async () => {
    const ethers = require('ethers')
    const zksync = require('zksync')
    const utils = require('./utils')
  
    // export NETWORK_NAME = rinkeby may be necessary before running Node.JS app
    const zkSyncProvider = await utils.getZkSyncProvider(zksync, process.env.NETWORK_NAME)
    const ethersProvider = await utils.getEthereumProvider(ethers, process.env.NETWORK_NAME)

    const bobRinkebyWallet = new ethers.Wallet(process.env.BOB_PRIVATE_KEY, ethersProvider) //sets up Bob's Rinkeby wallet
    console.log('Bob's Rinkeby address is: ${bobRinkebyWallet.address})')
    console.log('Bob's initial balance on Rinkeby is: ${ethers.utils.formatEther(await bobRinkebyWallet.getBalance())}')
    const bobZkSync = await utils.initAccount(bobRinkebyWallet, zkSyncProvider, zkSync)

    process.on('SIGINT', () => {
        console.log('Disconnecting')
        process.exit() // Disconnect
    }) //end process.on()
    setInterval(async () => {
        await utils.displayZkSyncBalance(bobZksyncWallet, ethers)
        console.log('---')
    }, SLEEP_INTERVAL)
})() //end setInterval()