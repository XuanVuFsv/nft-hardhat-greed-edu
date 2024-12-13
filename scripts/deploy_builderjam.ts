import hre from 'hardhat';

async function main() {
  const builderJam = await hre.viem.deployContract('BuilderJam');

  console.log(`Successful deployed BuilderJam NFT at ${builderJam.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
