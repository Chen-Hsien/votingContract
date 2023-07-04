require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();
require("solidity-coverage");
require("hardhat-gas-reporter");

const { API_URL, PRIVATE_KEY, SEPOLIASCAN_KEY } = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    sepolia: {
      url: API_URL,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: {
      sepolia: SEPOLIASCAN_KEY,
    },
  },
  gasReporter: {
    enabled: true,
    noColors: true,
    outputFile: "gas-report.txt",
  },
};
