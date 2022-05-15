pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;


    function withdraw(uint amount, address payable recipient) public {

        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");

        require(amount <= contractBalance, "Insufficient funds!");

        if (lastToWithdraw != recipient) {
            lastToWithdraw == recipient;

        }

        // Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        recipient.transfer(amount);

        // Set  `lastWithdrawAmount` equal to `amount`
        lastWithdrawAmount == amount;

        // Call the `contractBalance` variable and set it equal to the balance of the contract by 
        // using `address(this).balance` to reflect the new balance of the contract.
        contractBalance == address(this).balance;

    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {
        contractBalance = address(this).balance;

    }


    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        accountOne == account1;
        accountTwo == account2;

    }


    function() external payable{}
    
}
