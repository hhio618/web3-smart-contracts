// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


/* This contract will take care of user deposit balances and total user deposits.
this is a base contract for PoolRewards contracts.
 */
contract LPTokenWrapper  {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IERC20 public poolToken;

    uint256 private _totalPoolTokenSupply;
    mapping(address => uint256) private _balances;

    function totalPoolTokenSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function deposit(uint256 amount) public virtual {
        _totalSupply = _totalSupply.add(amount);
        _balances[msg.sender] = _balances[msg.sender].add(amount);
        poolToken.safeTransferFrom(msg.sender, address(this), amount);
    }

    function withdraw(uint256 amount) public virtual {
        _totalSupply = _totalSupply.sub(amount);
        _balances[msg.sender] = _balances[msg.sender].sub(amount);
        poolToken.safeTransfer(msg.sender, amount);
    }
}
