const ERC20tokan = artifacts.require("ERC20tokan");

module.exports = function(deployer) {
    const treasuryWallet = '0xdAC908AB5F7Adf0c6c7A5C5328f6AcAb39465Ea5'; //treasury wallet address
    deployer.deploy(ERC20tokan, treasuryWallet);
};
