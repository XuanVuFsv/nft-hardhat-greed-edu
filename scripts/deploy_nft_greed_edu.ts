import hre from 'hardhat';

async function main() {
  const NFTGreedEdu = await hre.viem.deployContract('NFTGreedEdu');

  console.log(`Successful deployed Greed Edu NFT at ${NFTGreedEdu.address}`);
  console.log(`Successful deployed Greed Edu NFT at ${await NFTGreedEdu.read.getContractAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
