pragma solidity ^0.4.11;

// Base contract for owner
contract Ownable {
    address owner;

    // Set owner
    function Ownable() {
        owner = msg.sender;
    }

    // Modifier chack only owner
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract RefferalPartnerContract is Ownable {

    uint private MIN_PAY = 0.1 ether;
    mapping(address => uint) payers;

    function() payable {
        require(msg.value >= MIN_PAY);
        payers[msg.sender] = msg.value;
        owner.transfer(msg.value);
    }
    
    function payOf(address _owner) constant returns (uint balance) {
        return payers[_owner];
    }
}