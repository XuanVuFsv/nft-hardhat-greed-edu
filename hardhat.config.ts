import { HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox-viem';
import * as Dotenv from 'dotenv';

Dotenv.config();

const config: HardhatUserConfig = {
  solidity: '0.8.20',
  networks: {
    "ancient8-celestia-testnet": {
      url: 'https://rpcv2-testnet.ancient8.gg',
      accounts: [process.env.PRIVATE_KEY!],
    },
  },
  etherscan: {
    apiKey: {
      "ancient8-celestia-testnet": '', // apiKey is not required, just set a placeholder
    },
    customChains: [
      {
        network: 'ancient8-celestia-testnet',
        chainId: 28122024,
        urls: {
          browserURL: 'https://scanv2-testnet.ancient8.gg',
          apiURL: 'https://scanv2-testnet.ancient8.gg/api',
        },
      },
    ],
  },
};

export default config;
