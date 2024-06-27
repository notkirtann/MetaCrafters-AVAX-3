# accessing a smart contract from local hardhat network and accessing it on remix ide 



The custom token will have following functionalities:
- The owner of the token will be able to mint tokens to other accounts
- Any user can transfer tokens to other accounts.
- Any user can burn tokens.



### Follow the steps to configure the project

#### 1. Create a hardhat Javascript project

Run the following commands to setup the project

```
npm init -y
npm install --save-dev hardhat
npm install @nomicfoundation/hardhat-toolbox
npx hardhat
```

Choose the (Javascript) option.

#### 2. Create a local Hardhat network

```
npx hardhat node
```

Note the URL and port at which the server is running

#### 3. Deploy the smart contract

```
npx hardhat run --network localhost scripts/deploy.js
```

Note the address of the smart contract


#### 4. Remix IDE

In the Remix IDE
- Go to the deploy tab.
- Select the environment as `Dev - Hardhat Provider`.
- Enter the URL of the Hardhat network in the dialog box. You will be able to access the accounts present in your local Hardhat network.
- Enter the address of the smart contract in the `At Address` tab.

Now you'll be able to interact with the custom token deployed on local Hardhat network. 
