# Food-delivery-system
# Gustavo Lambet &  Lucas Barros Chrispim

# 1º Step: Solidity smart contract code
pragma solidity ^0.5.0;

contract SimpleSmartContract {
    address payable public sender;
    address payable public receiver;
    uint public amount;

    constructor(address payable _receiver, uint _amount) public {
        sender = msg.sender;
        receiver = _receiver;
        amount = _amount;
    }


# The sender can initiate the transfer by calling the transfer function and providing the correct amount.
    function transfer() public payable {
        require(msg.sender == sender, "Only the sender can initiate the transfer.");
        require(msg.value == amount, "The amount to be transferred must match the agreed amount.");

        receiver.transfer(amount);
    }
}

# 2º Step: Interaction with the Smart contract using Remix

const SimpleSmartContractABI = [ ... ]; // replace with the ABI of the deployed smart contract
const SimpleSmartContractAddress = '0x...'; // replace with the address of the deployed smart contract

const contract = new web3.eth.Contract(SimpleSmartContractABI, SimpleSmartContractAddress);

async function createContract() {
    const receiver = '0x...'; // replace with the address of the receiver
    const amount = web3.utils.toWei('1', 'ether'); // replace with the amount to be transferred

    await contract.methods.createContract(receiver, amount).send({ from: sender, value: amount });
}

async function transfer() {
    const amount = web3.utils.toWei('1', 'ether'); // replace with the amount to be transferred

    await contract.methods.transfer().send({ from: sender, value: amount });
}