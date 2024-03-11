// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract StakingContract {
    error transferFaild();
    mapping(address => uint) public s_balances;
    function stake(uint _amount, address _token) external returns (bool) {
        s_balances[msg.sender] += _amount;
        bool sucess = IERC20(_token).transferFrom(
            msg.sender,
            address(this),
            _amount
        );
        if (!sucess) revert transferFaild();
        return sucess;
    }

    function withdraw() external {
        payable(msg.sender).transfer(address(this).balance);
    }
}
