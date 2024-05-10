// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract KYCContract {
    struct Customer {
        string name;
        string idNumber; // Could be SSN, Passport number etc.
        bool kycStatus;
    }

    mapping(address => Customer) public customers;

    event KYCUpdated(address indexed customer, bool status);

    function addOrUpdateKYC(address _customer, string memory _name, string memory _idNumber, bool _kycStatus) public {
        require(_customer != address(0), "Invalid customer address.");
        customers[_customer] = Customer(_name, _idNumber, _kycStatus);
        emit KYCUpdated(_customer, _kycStatus);
    }

    function getKYCStatus(address _customer) public view returns (bool) {
        return customers[_customer].kycStatus;
    }
}