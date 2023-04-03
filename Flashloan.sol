// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {
    ILoaner
} from "./Loaner.sol";

import "hardhat/console.sol";

interface IFlashloan {
    function flashloan(uint256 _amount) external;
}

contract Flashloan {
    IERC20 ktoken;

    constructor(address _token, address _setup) {
        ktoken = IERC20(_token);
        ktoken.approve(address(_setup), 1000 ether);
    }

    function flashloan(address _receive, uint256 _amount) public {
        uint256 beforeBalance = ktoken.balanceOf(address(this));

        ktoken.transfer(_receive, _amount);

        ILoaner(_receive).execute(_amount);

        uint256 afterBalance = ktoken.balanceOf(address(this));

        require(beforeBalance == afterBalance, "not enough original balance");
    }
}