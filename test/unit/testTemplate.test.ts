import { getNamedAccounts, network, deployments, ethers } from "hardhat"
import { assert, expect } from "chai"
import { developmentChains } from "../../helper-hardhat-config"
import { SolidityTemplate, StorageContract } from "../../typechain-types"
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers"

!developmentChains.includes(network.name)
    ? describe.skip
    : describe("SolidityTemplate", function () {
          let solidityTemplate: SolidityTemplate
          let deployer: string
          let solidityTemplateAddr: string
          let accounts: SignerWithAddress[]

          before(async () => {
              // deployer = accounts[0]
              deployer = (await getNamedAccounts()).deployer
              await deployments.fixture(["all"])
              solidityTemplate = await ethers.getContract("SolidityTemplate", deployer)
              solidityTemplateAddr = solidityTemplate.address
              // get accounts
              accounts = await ethers.getSigners()
          })
          describe("Constructor", function () {
              it("initializes i_owner to msg.sender", async () => {
                  const owner = await solidityTemplate.getOwner()
                  assert.equal(owner, deployer)
              })
          })
      })
