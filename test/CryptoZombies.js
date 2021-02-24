const CryptoZombies = artifacts.require("CryptoZombies"); //pulling from build folder is being simulated but not actually used in this practice session

contract("CryptoZombies", (accounts) => {
    let [alice, bob] = accounts;
    it("should be able to create a new zombie", async () => {
        const contractInstance = await CryptoZombies.new();
        const result = contractInstance.createRandomZombie(zombieNames[0], {from: alice});
    })
}) //end contract{}