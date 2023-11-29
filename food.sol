//1º Step: Solidity smart contract code

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