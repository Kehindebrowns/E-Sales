// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentHandler {
    event PaymentReceived(address indexed from, uint256 amount);

    function receivePayment() external payable {
        require(msg.value > 0, "Payment must be greater than 0");
        
        // Additional logic, if needed

        emit PaymentReceived(msg.sender, msg.value);
    }

    function withdraw() external {
        uint256 amountToWithdraw = 1 ether; // Specify the amount to withdraw
        require(address(this).balance >= amountToWithdraw, "Insufficient balance");
       
        (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        require(success, "Withdrawal failed");
    }
}
