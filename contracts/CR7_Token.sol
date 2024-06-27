// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract CR7_Token{
    string public tokenName = "Cristiano Ronaldo";
    string public tokenSymbol = "CR7";
    uint public currentCR7Supply = 0;
    uint public totalMintedCR7 = 0;
    uint public totalBurnedCR7 = 0;
    uint public total_CR7_Turnover = 0 ;
    address public tokenowner;

    mapping(address => uint) balance;

    constructor(){
        tokenowner = msg.sender;
    }

    function getCR7Balance() external view returns (uint){
        return balance[msg.sender];
    }

    function MintCR7Tokens(uint _amount) public  {
        require(msg.sender == tokenowner,"You do not have the required permissions to mint tokens");
        balance[msg.sender] += _amount;
        currentCR7Supply += _amount;
        totalMintedCR7 += _amount;
        
    }

     function BurnCR7Tokens(uint _amount) public  {
        if(balance[msg.sender] >= _amount){
        balance[msg.sender] -= _amount;
        currentCR7Supply -= _amount;
        totalBurnedCR7 += _amount;
        }
    }

    function SendCR7Tokens(address _address, uint _amount) public{
        require(balance[msg.sender] >= _amount,"Insufficient funds in the account, unable to proceed with the transfer.");
        balance[_address] += _amount;
        balance[msg.sender] -= _amount;
        currentCR7Supply -= _amount;
        
    }

    function calculateTurnover() external returns(uint){
        total_CR7_Turnover = totalBurnedCR7 + totalMintedCR7;
        return total_CR7_Turnover;
    }
}
