const hre = require("hardhat");

async function main() {
  const Project = await hre.ethers.getContractFactory("Project");
  const project = await Project.deploy();

  await project.deployed();
  console.log("Project contract deployed to:", project.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
