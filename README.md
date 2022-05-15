
<!-- Find and Replace All [repo_name] -->
<!-- Replace [product-screenshot] [product-url] -->
<!-- Other Badgets https://naereen.github.io/badges/ -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]



# Blockchain Wallets - FinTech Finder
This repository contains a a FinTech application that enables customers to send cryptocurrency payments to fintech professionals using thier public Ethereum address.

---

## Technologies

NOTE: Please refer to python files for entirety of main source code. In addition, a .env file should be created in your local repository that contains your Mnemonic seed phrase.

This project leverages the following tools:

- Conda
- Python 3.7
- Streamlit
- Web3
- VSCode
- Git Bash
- Truffle/Ganache

To run this application, open fintech_finder.py in VSCode and open a new terminal. In addition, make sure Ganache is open and activated. Once the new terminal window is opened, run the following command "streamlit run fintech_finder.py". Next, Once Streamlit is opened, you may explore the application and complete as many test transactions as needed.

The following functions have been modulized and are located in crypto_wallet.py:

```
def generate_account():
    """Create a digital wallet and Ethereum account from a mnemonic seed phrase."""
    # Fetch mnemonic from environment variable.
    mnemonic = os.getenv("MNEMONIC")

    # Create Wallet Object
    wallet = Wallet(mnemonic)

    # Derive Ethereum Private Key
    private, public = wallet.derive_account("eth")

    # Convert private key into an Ethereum account
    account = Account.privateKeyToAccount(private)

    return account

def get_balance(w3, address):
    """Using an Ethereum account address access the balance of Ether"""
    # Get balance of address in Wei
    wei_balance = w3.eth.get_balance(address)

    # Convert Wei value to ether
    ether = w3.fromWei(wei_balance, "ether")

    # Return the value in ether
    return ether


def send_transaction(w3, account, to, wage):
    """Send an authorized transaction to the Ganache blockchain."""
    # Set gas price strategy
    w3.eth.setGasPriceStrategy(medium_gas_price_strategy)

    # Convert eth amount to Wei
    value = w3.toWei(wage, "ether")

    # Calculate gas estimate
    gasEstimate = w3.eth.estimateGas({"to": to, "from": account.address, "value": value})

    # Construct a raw transaction
    raw_tx = {
        "to": to,
        "from": account.address,
        "value": value,
        "gas": gasEstimate,
        "gasPrice": 0,
        "nonce": w3.eth.getTransactionCount(account.address)
    }

    # Sign the raw transaction with ethereum account
    signed_tx = account.signTransaction(raw_tx)

    # Send the signed transactions
    return w3.eth.sendRawTransaction(signed_tx.rawTransaction)
   ```
   

---
## Streamlit Interface

The following screenshots below shows the Streamlit user interface in which you are able to select a FinTech Professional, view thier public Ethereum address and thier hourly rate in ETH. Using the sidebars selections, you can input the requested professional and the number of hours requested for work which will then generate the total wage in Ether for the work. Once you press the "Send Transaction" button, a transaction hash is printed on the bottom of the sidebar and the transaction is sent to the local Ganache blockchain.

![image](https://user-images.githubusercontent.com/96163075/167982143-64fb2dc6-9c20-4297-8cfc-d70ab402a8fd.png)

![Ganache_Balance](https://user-images.githubusercontent.com/96163075/167982298-17adf891-96a9-4acd-b458-ddba66bd0d79.PNG)

![Ganache_Transaction](https://user-images.githubusercontent.com/96163075/167982305-3188c881-39cd-4127-85e9-9f669e2733be.PNG)

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
