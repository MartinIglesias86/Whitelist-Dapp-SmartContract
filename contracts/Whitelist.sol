//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    //maximum number of whitelisted addreses allowed
    uint8 public maxWhitelistedAddresses;

    //mapping of whitelisted addresses - if the address is whitelisted we would set it to true
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted is used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //setting the Max number of whitelisted addresses, user will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //adding the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        //check if we have reached the max number of whitelisted addresses allowed
        require(maxWhitelistedAddresses < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        //add the address wich called the function to the whitelist
        whitelistedAddresses[msg.sender] = true;
        //increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;

    }
}