import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const MintableERC721 = await ethers.getContractFactory("MintableERC721");
  const mintableERC721 = await MintableERC721.deploy();

  console.log("MintableERC721 deployed to:", await mintableERC721.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
