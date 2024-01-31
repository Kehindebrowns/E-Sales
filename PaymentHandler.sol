// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentHandler {
struct User {
    address addr;
    string username;
    string passwordHash;

    mapping(address => User) public users;

function register(string memory _username, string memory _passwordHash) public {
    User memory newUser = User(msg.sender, _username, _passwordHash);
    users[msg.sender] = newUser;
}
function login(string memory _passwordHash) public view returns (bool) {
    return keccak256(abi.encodePacked((users[msg.sender].passwordHash))) == keccak256(abi.encodePacked((_passwordHash)));
}

}
  
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
