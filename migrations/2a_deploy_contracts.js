var HelloWorld = artifacts.require("./BanksPublicKeysRepo.sol");
module.exports = function(deployer) {

    deployer.deploy(HelloWorld);
  };
