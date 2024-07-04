// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CR7Token is ERC20 {
    address public owner;
    uint public totalMintedCR7 = 0;
    uint public totalBurnedCR7 = 0;
    uint public totalCR7Turnover = 0;

    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        owner = msg.sender;
        _mint(owner, initialSupply * 10 ** uint(decimals()));
        totalMintedCR7 = initialSupply * 10 ** uint(decimals());
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        totalMintedCR7 += amount;
        updateTurnover();
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        totalBurnedCR7 += amount;
        updateTurnover();
    }

    function updateTurnover() internal {
        totalCR7Turnover = totalMintedCR7 + totalBurnedCR7;
    }

    function calculateTurnover() external view returns (uint) {
        return totalCR7Turnover;
    }
}
