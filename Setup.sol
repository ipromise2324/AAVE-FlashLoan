// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import {
    KToken
} from "./KToken.sol";

import {
    Flashloan,
    IFlashloan
} from "./Flashloan.sol";

import {
    Loaner
} from "./Loaner.sol";

contract Setup {

    KToken public ktoken;
    Flashloan public flashloan;
    Loaner public loaner;

    constructor() {
        ktoken = new KToken();
        flashloan = new Flashloan(address(ktoken), address(this));
        ktoken.mint(address(flashloan));
        loaner = new Loaner(address(ktoken));
    }

    function runLoaner(address _receive, uint256 _amount) public {
        flashloan.flashloan(_receive, _amount);
    }
}