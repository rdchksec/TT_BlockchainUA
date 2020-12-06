var USDT = artifacts.require("USDT");
var OwnableExample = artifacts.require("OwnableExample");
var Owntkn = artifacts.require("Owntkn");

module.exports = function(deployer) {
  // deployment steps
  const usdt = deployer.deploy(USDT);
  const oe = deployer.deploy(OwnableExample);
  const owntkn = deployer.deploy(Owntkn);

};
