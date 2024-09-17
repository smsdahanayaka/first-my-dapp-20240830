const ERC20TestToken = artifacts.require("ERC20TestToken");

module.exports = function (deployer) {
//   const initialSupply = web3.utils.toWei('1000', 'ether');  // Set initial supply to 1000 tokens (adjust as needed)
  deployer.deploy(ERC20TestToken);
};
