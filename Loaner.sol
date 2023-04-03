// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ILoaner {
    function execute(uint256 _amount) external;
}

contract Loaner {
    IERC20 ktoken;

    event DoExecute(bool);

    constructor(address _token) {
        ktoken = IERC20(_token);
    }

    function execute(uint256 _amount) public {
        ktoken.transfer(msg.sender, _amount);

        emit DoExecute(true);
    }
}