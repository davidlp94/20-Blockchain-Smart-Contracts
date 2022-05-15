
<!-- Find and Replace All [repo_name] -->
<!-- Replace [product-screenshot] [product-url] -->
<!-- Other Badgets https://naereen.github.io/badges/ -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]



# Blockchain Smart Contracts - Joint Savings Account
This repository contains a smart contract (joint_savings.sol) that is desgined to automate the creation of joint savings accounts. This Solidity smart contract accepts two user addresses that will be able to control a joint savings account with standard deposit, withdrawal and check-balance functions.

---

## Technologies

NOTE: Please refer to entire smart contract for entirety of main source code.

This project leverages the following tools:

- Conda
- Solidity - 0.5.0
- Remix IDE
- Git Bash
- Truffle/Ganache

Since Remix IDE can be ran in a standard Web browser, such as Chrome or Brave, the entire solidity code can be copied and pasted into your Remix IDE to follow along this README.md. No programs, modules or installs are required to test out this smart contract. All you need is a computer, web browser and an internet connection!

There are three main functions to this application (Please refer to joint_savings.sol for full source code):

```
function setAccounts(address payable account1, address payable account2) public {}
 
function withdraw(uint amount, address payable recipient) public {}

function deposit() public payable {}
```
The setAccounts function takes (2) account addresses and designates them as authorized account holders that can deposit and withdraw.

The withdraw function withdraws funds from the smart contract and transfers them to the "recipient" with a few conditional statements. First, the account balance has to be greater than the withdrawal amount. Also, the "recipient" has to be an authorized user. Using Solidity's conditional "require" we are able to accomplish this, see relative code below:

```
    require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
    require(amount <= contractBalance, "Insufficient funds!");
    if (lastToWithdraw != recipient) {
                lastToWithdraw = recipient;
```

---
## Completing Transactions

Note: Please refer to folder Execution_Results for screenshots of complete transactions.

Using the Remix IDE in a web browser, this smart contract was successfully deployed and tested. The following screenshot shows an input of (2) account addresses, a withdrawal amount, resulting contract balance, recipient address info and amount last withdraw. The Remix IDE terminal window shows relative contract addresses and hash tx as well.

![Remix IDE](https://github.com/davidlp94/20-Blockchain-Smart-Contracts/blob/main/Execution_Results/Step_3.2.JPG)

---

## Contributors
David Lee Ping [Linkedin](https://www.linkedin.com/in/david-lee-ping/)

---
Other Acknowledgements
* [Img Shields](https://shields.io)
* [Choose an Open Source License](https://choosealicense.com)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/davidlp94/18-Blockchain-With-Python.svg?style=for-the-badge
[contributors-url]: https://github.com/davidlp94/18-Blockchain-With-Python/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/davidlp94/18-Blockchain-With-Python.svg?style=for-the-badge
[forks-url]: https://github.com/davidlp94/18-Blockchain-With-Python/network/members
[stars-shield]: https://img.shields.io/github/stars/davidlp94/18-Blockchain-With-Python.svg?style=for-the-badge
[stars-url]: https://github.com/davidlp94/18-Blockchain-With-Python/stargazers
[issues-shield]: https://img.shields.io/github/issues/davidlp94/18-Blockchain-With-Python/network/members?style=for-the-badge
[issues-url]: https://github.com/davidlp94/18-Blockchain-With-Python/issues
[license-url]: https://choosealicense.com/licenses/mit/#

---
## License

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
