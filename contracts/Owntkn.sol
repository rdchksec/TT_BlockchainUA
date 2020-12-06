pragma solidity ^0.5.0;

import "../openzeppelin-solidity/contracts/token/ERC721/ERC721Burnable.sol";
import "../openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "../openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Owntkn is ERC721Burnable, Ownable {

  IERC20 usdt;
  mapping (address => address) owners;
  mapping (address => uint) prices;
  mapping (address => bool) loaned;

  constructor() public {

  }

  function setOwnership(address _scAddr) public {
    Ownable _sc = Ownable(_scAddr);
    owners[_scAddr] = _sc.owner();
  }

  function mintTkn(address _scAddr, uint _price) public {
    Ownable _sc = Ownable(_scAddr);
    require(_sc.owner() == address(this));
    require(owners[_scAddr] != address(0));
    super._mint(owners[_scAddr], uint(_scAddr));
    prices[_scAddr] = _price;
  }

  function redeemTkn(address _scAddr) public {
    require(msg.sender == ownerOf(uint(_scAddr)));
    require(loaned[_scAddr] == false);
    Ownable _sc = Ownable(_scAddr);
    _sc.transferOwnership(msg.sender);
    _burn(uint(_scAddr));
  }

  function getLoan(address _scAddr) public {
    require(loaned[_scAddr] == false);
    require(msg.sender == ownerOf(uint(_scAddr)));
    loaned[_scAddr] = true;
    usdt.transfer(msg.sender, prices[_scAddr]);
  }

  function compLoan(address _scAddr) public {
    require(loaned[_scAddr] == true);
    require(msg.sender == ownerOf(uint(_scAddr)));
    usdt.transferFrom(msg.sender, address(this), prices[_scAddr] * 5 / 4);
    loaned[_scAddr] = false;
  }

  function setUSDTaddr(address _usdt) public {
    usdt = IERC20(_usdt);
  }

}
