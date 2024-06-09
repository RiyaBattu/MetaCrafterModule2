// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract RiyaBattu {

    // Public variables to store details about the token
    string public tokenName = "RiyaBattu";
    string public tokenAbbrv = "RRB";
    uint public totalSupply = 0;

    // Mapping to store balances of addresses
    mapping(address => uint) public balances;

    // Mint function to increase total supply and balance of the recipient
    function issueTokens(address recipient, uint amount) public {
        totalSupply += amount;
        balances[recipient] += amount;
    }

    // Burn function to decrease total supply and balance of the sender
    function redeemTokens(address holder, uint amount) public {
        if (balances[holder] >= amount) {
            totalSupply -= amount;
            balances[holder] -= amount;
        } else {
            revert("Insufficient balance to redeem");
        }
    }
}
