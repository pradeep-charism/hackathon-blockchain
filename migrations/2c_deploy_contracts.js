var HelloWorld = artifacts.require("./SSIRepository.sol");
module.exports = function(deployer) {

    deployer.deploy(HelloWorld);
  };
