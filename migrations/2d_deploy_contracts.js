var HelloWorld = artifacts.require("./BankPaymentsContract.sol");
module.exports = function(deployer) {
    deployer.deploy(HelloWorld);
  };
