var pk = artifacts.require("./BanksPublicKeysRepo.sol");
module.exports = function(deployer) {
    deployer.deploy(pk);
  };
