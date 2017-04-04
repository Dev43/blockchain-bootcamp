var NHLPredictor = artifacts.require("./NHLPredictor.sol");
var strings = artifacts.require("./strings.sol");

module.exports = function(deployer) {
  deployer.deploy(NHLPredictor);
  deployer.link(strings, NHLPredictor);
};
