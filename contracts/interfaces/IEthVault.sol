// SPDX-License-Identifier: BUSL-1.1

pragma solidity =0.8.20;

import {IVaultAdmin} from './IVaultAdmin.sol';
import {IVaultVersion} from './IVaultVersion.sol';
import {IVaultFee} from './IVaultFee.sol';
import {IVaultState} from './IVaultState.sol';
import {IVaultValidators} from './IVaultValidators.sol';
import {IVaultEnterExit} from './IVaultEnterExit.sol';
import {IVaultOsToken} from './IVaultOsToken.sol';
import {IVaultMev} from './IVaultMev.sol';
import {IVaultEthStaking} from './IVaultEthStaking.sol';
import {IMulticall} from './IMulticall.sol';

/**
 * @title IEthVault
 * @author StakeWise
 * @notice Defines the interface for the EthVault contract
 */
interface IEthVault is
  IVaultAdmin,
  IVaultVersion,
  IVaultFee,
  IVaultState,
  IVaultValidators,
  IVaultEnterExit,
  IVaultOsToken,
  IVaultMev,
  IVaultEthStaking,
  IMulticall
{
  /**
   * @dev Struct for initializing the EthVault contract
   * @param capacity The Vault stops accepting deposits after exceeding the capacity
   * @param feePercent The fee percent that is charged by the Vault
   * @param metadataIpfsHash The IPFS hash of the Vault's metadata file
   */
  struct EthVaultInitParams {
    uint256 capacity;
    uint16 feePercent;
    string metadataIpfsHash;
  }

  /**
   * @notice Initializes the EthVault contract. Must transfer security deposit together with a call.
   * @param params The encoded parameters for initializing the EthVault contract
   */
  function initialize(bytes calldata params) external payable;

  /**
   * @notice Function for retrieving total shares
   * @return The amount of shares in existence
   */
  function totalSupply() external view returns (uint256);

  /**
   * @notice Returns the balance of a user
   * @param account The account for which to look up the number of shares it has, i.e. its balance
   * @return The number of shares held by the account
   */
  function balanceOf(address account) external view returns (uint256);
}
