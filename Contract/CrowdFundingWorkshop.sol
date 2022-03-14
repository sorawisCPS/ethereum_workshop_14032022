// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract CrowdFunding{
    // Declare SafeMath for uint256
    using SafeMath for uint256;

    // Declare balance parameter
    uint public totalBalance = 0;
    mapping (address => uint256) public accounts;


    // Declare owner parameter and constructor
    address private owner;
    constructor() {
        owner = msg.sender;
    }

    // Declare event
    event DonateResult(address user, uint256 number);

    // Declare get balance
    function balance() public view returns(uint) {
        return totalBalance;
    }

    // Donate function
    function donate() public payable {
        require(msg.value > 0, "Donate amount must more than 0.");
        totalBalance += msg.value;
        emit DonateResult(msg.sender, msg.value);
    }

    // Get Fund Function
    function getFund() public {
        require(totalBalance > 0, "Balance is not enough to withdrow");
        payable(owner).transfer(totalBalance);
        totalBalance = 0;
    }
}