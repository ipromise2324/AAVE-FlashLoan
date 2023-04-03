// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KToken is ERC20 {
    constructor() ERC20("KToken", "KT") {}

    function mint(address _receiver) public {
        _mint(_receiver, 100 ether);
    }
}