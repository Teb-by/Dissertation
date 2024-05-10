const BankingTransactions = artifacts.require("BankingTransactions");
const KYCContract = artifacts.require("KYCContract");

module.exports = function (deployer) {
  deployer.deploy(BankingTransactions);
  deployer.deploy(KYCContract);
};
