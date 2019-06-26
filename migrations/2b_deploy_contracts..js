var ssiService = artifacts.require("./SsiService.sol");
module.exports = function(deployer) {
    deployer.deploy(ssiService);
  };
