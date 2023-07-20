// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/**
* This smart contract defines the safety and security rules 
* for TRIPLE digital twins implemented using Microsoft
* Azure Digital Twins (ADT) platform.
*/
contract Triple_DigitalTwins_SnS_Rules {

     /**
     * Variable to define who can deploy the contract.
     */
    address owner;  // address indicates variable type, in this case, contract creator account address.

    /**
     * Constructor code is only run when the contract is created.
     */
    constructor() public {
         // The msg variable is a special global variable containing properties allowing blockchain access.
        owner = msg.sender; //msg.sender indicates the contract creator (contract owner)
    }

    /**
     * Modifier to ensure only the admin can execute certain functions.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _; // ; indicates it is a modifier function
    }

    /**
     * Minimum allowed and safe temperature during working mode.
     */
    int minTemp;

    /**
     * Maximum allowed and safe temperature during the working mode.
     */
    int maxTemp;

    /**
    * System should set the minimum and maximum threshold for allowed
    * and safe temperature during working mode.
    */
    function setTemperatureThreshold(int _minThreshold, int _maxThreshold) onlyOwner public {
        // set minimum temperature
        minTemp = _minThreshold;
        // set maximum temperature
        maxTemp = _maxThreshold;
    }

    /**
    * System should return the defined minimum and maximum threshold.
    */
    function getTemperatureThreshold() public view returns (int, int) {
       // return defined minimum and maximum temperature 
       return (minTemp, maxTemp);
    }

}
