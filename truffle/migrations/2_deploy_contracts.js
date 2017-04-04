var NHLPredictor = artifacts.require("./NHLPredictor.sol");

module.exports = function(deployer) {

  deployer.deploy(NHLPredictor);
};
