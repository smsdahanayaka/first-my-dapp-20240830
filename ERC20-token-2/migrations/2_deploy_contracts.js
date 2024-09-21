const TestToken = artifacts.require("TestToken");

module.exports = function(deployer) {
    const treasuryWallet = '0xdAC908AB5F7Adf0c6c7A5C5328f6AcAb39465Ea5'; //treasury wallet address
    deployer.deploy(TestToken, treasuryWallet);
};
