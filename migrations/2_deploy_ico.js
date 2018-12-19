var VenovaToken = artifacts.require("./Venova.sol");
var VenovaCrowdsale = artifacts.require("./VenovaCrowdsale.sol");
const duration = {
  seconds: function (val) { return val; },
  minutes: function (val) { return val * this.seconds(60); },
  hours: function (val) { return val * this.minutes(60); },
  days: function (val) { return val * this.hours(24); },
  weeks: function (val) { return val * this.days(7); },
  years: function (val) { return val * this.days(365); },
};
module.exports = async function(deployer, network, accounts) {
  deployer.deploy(VenovaToken, "Venova Network", "VNV", 18).then(async () => {
    const deployedToken = await VenovaToken.deployed();
    const rate = 1000; // 1 eth = 1000 VNV tokens
    const wallet = accounts[0];
    const timeNow = Math.floor(Date.now() / 1000);
    const openingTime = timeNow  + duration.seconds(30);
    const closingTime = timeNow  + duration.years(1);
    const cap = web3.toWei(1); // 1 eth
    await deployer.deploy(VenovaCrowdsale, rate, wallet, deployedToken.address, openingTime, closingTime, cap);
    const deployedCrowdsale = await VenovaCrowdsale.deployed();
    await deployedToken.transferOwnership(deployedCrowdsale.address);
    return true;

  })



};
