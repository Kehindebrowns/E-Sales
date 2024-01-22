// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Emarket {
    uint256 public totalMarket;
    mapping(address => Market) public market;

    struct Market {
        string user;
        string customer;
        string login;
        string logout;
        string firstname;
        string lastname;
        string email;
        uint256 phoneNumber;
        string items;
        address walletAddress;
        uint256 amount;
        address payer;
        address payee;
        bool paid;
    }

    function addEMarket(
        string memory _user,
        string memory _customer,
        string memory _login,
        string memory _logout,
        string memory _firstname,
        string memory _lastname,
        string memory _email,
        uint256 _phoneNumber,
        string memory _items,
        address _walletAddress,
        uint256 _amount,
        address _payer,
        address _payee,
        bool _paid
    ) public {
        Market storage newMarket = market[msg.sender];
        newMarket.user = _user;
        newMarket.customer = _customer;
        newMarket.login = _login;
        newMarket.logout = _logout;
        newMarket.firstname = _firstname;
        newMarket.lastname = _lastname;
        newMarket.email = _email;
        newMarket.phoneNumber = _phoneNumber;
        newMarket.items = _items;
        newMarket.walletAddress = _walletAddress;
        newMarket.amount = _amount;
        newMarket.payer = _payer;
        newMarket.payee = _payee;
        newMarket.paid = _paid;

        totalMarket++;
    }

    function getMarketDetail() external view returns (Market memory) {
        return market[msg.sender];
    }

    function balanceOf() public view returns (uint256) {
        return address(this).balance;
    }

    event PaymentReceived(address indexed from, uint256 amount);

    modifier onlyPayer() {
        require(msg.sender == market[msg.sender].payer, "Only payer can call this function");
        _;
    }

    modifier onlyPayee() {
        require(msg.sender == market[msg.sender].payee, "Only payee can call this function");
        _;
    }

    modifier notPaid() {
        require(!market[msg.sender].paid, "Payment has already been made");
        _;
    }

    function makePayment() external onlyPayer notPaid payable {
        require(msg.value == market[msg.sender].amount, "Incorrect payment amount");
        market[msg.sender].payee.transfer(msg.value);
        // mark the payment as complete
        market[msg.sender].paid = true;
        emit PaymentReceived(msg.sender, msg.value);
    }

    function getPaymentDetail() external view returns (address, address, uint256, bool) {
        return (
            market[msg.sender].payer,
            market[msg.sender].payee,
            market[msg.sender].amount,
            market[msg.sender].paid
        );
    }

    function incrementCart(string memory _items) public {
        market[msg.sender].items = _items;
    }

    function decrementCart(string memory _items) public {
        market[msg.sender].item = _item
    }

    function addClothes() external {
        clothes++;
    }

    contract Location  is Emarket{
        struct Location {
            address userAddress;
            int256  latitude;
            int256 longitude;

        }
        mapping(address=> Location) public userLocation;

        function setUserLocation(int256 _latitude,int256 _longitiude) public  {
            user.location[msg.sender]=location(msg.sender,_latitude,_longitiude)
        }
    }
 function inc() external{
     wallet address=[msg.sender].wallet;
}
 

   
    }
    
   
    

          


  

   
