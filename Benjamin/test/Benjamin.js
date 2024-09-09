const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Benjamin Token", function () {
    let Benjamin;
    let benjamin;
    let owner;
    let addr1;
    let addr2;

    beforeEach(async function () {
        // Get the ContractFactory and Signers here.
        Benjamin = await ethers.getContractFactory("Benjamin");
        [owner, addr1, addr2] = await ethers.getSigners();

        // Deploy the contract with a reward value of 100
        benjamin = await Benjamin.deploy();
        console.log(benjamin.address);
    });

    it("Should deploy with correct initial values", async function () {
        // Check contract owner
        expect(await benjamin.owner()).to.equal(owner.address);

        // Check initial supply
        const initialSupply = await benjamin.totalSupply();
        const initialSupplyExpected = ethers.utils.parseUnits("7000000", await benjamin.decimals());
        expect(initialSupply).to.equal(initialSupplyExpected);

        // Check if contract is active
        expect(await benjamin.isActive()).to.be.true;
    });
});

