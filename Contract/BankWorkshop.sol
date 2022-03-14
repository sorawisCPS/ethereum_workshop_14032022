// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Bank {
    // Declare accounts parameter
    mapping (address => uint256) private accounts;

    // Declare owner
    address private owner;
    constructor() {
        owner = msg.sender;
    }

    // Get balance
    function balance() public view returns(uint) {
        return accounts[owner];
    }

    // Deposit function
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must more than 0.");
        accounts[owner] += msg.value;
    }

    // Withdraw function
    function withdraw(uint256 money) public {
        require(money <= accounts[owner], "Balance is not enough to withdrow");
        payable(owner).transfer(money);
        accounts[owner] -= money;
    }
}