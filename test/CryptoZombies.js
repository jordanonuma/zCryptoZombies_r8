const CryptoZombies = artifacts.require("CryptoZombies"); //pulling from build folder is being simulated but not actually used in this practice session

contract("CryptoZombies", (accounts) => {
    let [alice, bob] = accounts;
    it("should be able to create a new zombie", async () => {
        const contractInstance = await CryptoZombies.new();
        const result = await contractInstance.createRandomZombie(zombieNames[0], {from: alice});
        assert.equal(result.receipt.status, true);
        assert.equal(result.logs[0].args.name, zombieNames[0]);
    })
}) //end contract{}