// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

interface IPoolRewards {

    function depositPoolTokens(uint256 amount) external;

    function withdrawPoolTokens(uint256 amount) external;

    function claimableReward(address account) external returns (uint256);

    function claimReward() external;

    function withdrawPoolTokensAndClaimReward() external;
}
