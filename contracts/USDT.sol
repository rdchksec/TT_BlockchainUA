pragma solidity ^0.5.0;

import "../openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "../openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract USDT is ERC20, ERC20Detailed {

  constructor() public ERC20Detailed("USDT", "USDT", 18){
    _mint(0x932Effb7f47f75126468F665E0651B090ec42552, 1000000000000000000);
  }
}
