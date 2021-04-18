(async () => {
    const ethers = require('ethers')
    const zksync = require('zksync')
    const utils = require('./utils')
  
    export NETWORK_NAME = rinkeby
    const zkSyncProvider = utils.getZkSyncProvider(zksync, process.env.NETWORK_NAME)
    const ethersProvider = utils.getEthereumProvider(ethers, process.env.NETWORK_NAME)
})()