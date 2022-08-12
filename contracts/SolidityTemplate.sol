/*-------------------- Pragmas -----------------------*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

/*-------------------- Imports -----------------------*/

/*-------------------- Interfaces --------------------*/

/*-------------------- Libraries ---------------------*/

/*-------------------- Errors ------------------------*/
error SolidityTemplate__NotOwner();

/*-------------------- Contracts ---------------------*/

/** @title A contract for demonstrating solidity
 *  @author
 *  @notice This contract is to demo the format of a contract
 *  @dev This implements ...
 */
contract SolidityTemplate {
    /*-------------------- Type Declarations ---------------------*/

    /*-------------------- State Varibles ------------------------*/
    uint256 uint256Example;
    uint256 public constant SECONDS_IN_A_DAY = 24 * 60 * 60;
    mapping(address => uint256) internal s_addressToAmountFunded;
    address private immutable i_owner;

    /*-------------------- Events --------------------------------*/

    /*-------------------- Modifiers -----------------------------*/
    modifier onlyOwner() {
        // require(msg.sender == owner);
        if (msg.sender != i_owner) revert SolidityTemplate__NotOwner();
        _;
    }

    /*-------------------- constructor function -----------------------------*/

    constructor() {
        i_owner = msg.sender;
    }

    /*-------------------- receive function ---------------------------------*/

    /*-------------------- fallback function --------------------------------*/

    /*-------------------- external functions -------------------------------*/

    /*-------------------- public functions ---------------------------------*/

    /** @notice This function is a public Function
     */
    function publicFuncFormat() public payable {}

    /*-------------------- internal functions -------------------------------*/

    function internalFuncFormat() internal {}

    /*-------------------- private functions --------------------------------*/

    function privateFuncFormat() private {}

    /*-------------------- view / pure functions ----------------------------*/

    function getOwner() public view returns (address) {
        return i_owner;
    }
}
