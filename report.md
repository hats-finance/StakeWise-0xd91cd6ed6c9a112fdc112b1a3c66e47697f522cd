# **StakeWise Audit Competition on Hats.finance** 


## Introduction to Hats.finance


Hats.finance builds autonomous security infrastructure for integration with major DeFi protocols to secure users' assets. 
It aims to be the decentralized choice for Web3 security, offering proactive security mechanisms like decentralized audit competitions and bug bounties. 
The protocol facilitates audit competitions to quickly secure smart contracts by having auditors compete, thereby reducing auditing costs and accelerating submissions. 
This aligns with their mission of fostering a robust, secure, and scalable Web3 ecosystem through decentralized security solutions​.

## About Hats Audit Competition


Hats Audit Competitions offer a unique and decentralized approach to enhancing the security of web3 projects. Leveraging the large collective expertise of hundreds of skilled auditors, these competitions foster a proactive bug hunting environment to fortify projects before their launch. Unlike traditional security assessments, Hats Audit Competitions operate on a time-based and results-driven model, ensuring that only successful auditors are rewarded for their contributions. This pay-for-results ethos not only allocates budgets more efficiently by paying exclusively for identified vulnerabilities but also retains funds if no issues are discovered. With a streamlined evaluation process, Hats prioritizes quality over quantity by rewarding the first submitter of a vulnerability, thus eliminating duplicate efforts and attracting top talent in web3 auditing. The process embodies Hats Finance's commitment to reducing fees, maintaining project control, and promoting high-quality security assessments, setting a new standard for decentralized security in the web3 space​​.

## StakeWise Overview

StakeWise is a staking protocol on Ethereum offering permissionless access to liquid staking for all nodes.

## Competition Details


- Type: A public audit competition hosted by StakeWise
- Duration: 2 weeks
- Maximum Reward: $150,000
- Submissions: 140
- Total Payout: $15,999 distributed among 7 participants.

## Scope of Audit

No scope available.

## Medium severity issues


- **Flashloan Attack Risk Through Delayed Harvest in KeeperRewards Vault Function**

  The issue focuses on a security vulnerability found within `VaultEnterExit.sol` and `KeeperRewards.sol` in the Stakewise/v3-core repository. The `isHarvestRequired()` function potentially allows for one pending update, causing a significant problem when it's used to verify whether a vault requires harvesting before a user deposits. Consequently, this can be exploited by an offender using flashloans to deposit considerable assets and usurp profits from the latest update. To mitigate this, it's recommended to only allow deposits and other operations when all pending updates are gathered. This could be accomplished by enhancing `isHarvestRequired()` to return `true` when the vault is one rewards update behind. However, a fix was shared, ensuing a discussion about the severity of this challenge. While there was initial debate, a consensus of medium severity was reached due to the highly unlikely nature of successful execution.


  **Link**: [Issue #14](https://github.com/hats-finance/StakeWise-0xd91cd6ed6c9a112fdc112b1a3c66e47697f522cd/issues/14)

## Low severity issues


- **Incorrect Typehash Declarations Affect EIP-712 Compliance in KeeperRewards and KeeperValidators**

  A bug was found in KeeperRewards.sol and KeeperValidators.sol contracts where the EIP-712 standard's typehash for several functions was incorrectly declared, causing the signature verification to be non-compliant with the EIP-712 standard. This mismatch can lead to valid signatures being considered invalid resulting in reversions. The recommended fix is to adjust these typehashes to match with correct types. The issue is now resolved.


  **Link**: [Issue #3](https://github.com/hats-finance/StakeWise-0xd91cd6ed6c9a112fdc112b1a3c66e47697f522cd/issues/3)


- **Issue with UpdateRewards Function in KeeperRewards.sol Allowing Unverified Changes**

  The issue focuses on a vulnerability in KeeperRewards.sol, where the updateRewards() function, if called before rewardsMinOracles is set, allows rewards to be updated without any oracle signatures. This could result in a user updating rewards without any oracle signatures due to a delay in the call to setRewardsMinOracles(). The solution proposed is to set rewardsMinOracles in the constructor, then use the function to update the value.


  **Link**: [Issue #13](https://github.com/hats-finance/StakeWise-0xd91cd6ed6c9a112fdc112b1a3c66e47697f522cd/issues/13)


- **VaultEnterExit.sol Potential Issue with EnterExitQueue() and High Share-to-Asset Ratio**

  The issue originates in the 'VaultEnterExit.sol' file. The 'enterExitQueue()' function, meant for facilitating user withdrawals, could potentially cause trouble if the vault's shares to assets ratio is high. This is due to the 'queuedShares' being downcast to a 'uint96' while it should be able to account for larger numbers resulting from large share to assets ratios. Suggestions for mitigation include storing 'queuedShares' as a 'uint128' and adjusting the 'Checkpoints' struct accordingly.


  **Link**: [Issue #41](https://github.com/hats-finance/StakeWise-0xd91cd6ed6c9a112fdc112b1a3c66e47697f522cd/issues/41)


- **Early Migration from V2 to V3 Allows Unfair Share Gain in Genesis Vault**

  The issue in `EthGenesisVault.sol` involves the migration from V2 to V3. Due to no check ensuring the vault is collateralized, users can migrate before the first harvest and unfairly gain more shares in the Genesis Vault compared to users who migrate after. This can lead to loss of funds for post-harvest migrators. The recommended mitigation is to allow `migrate()` to be called only after the Genesis Vault has been collateralized.


  **Link**: [Issue #120](https://github.com/hats-finance/StakeWise-0xd91cd6ed6c9a112fdc112b1a3c66e47697f522cd/issues/120)



## Conclusion

The audit of Hats.finance and StakeWise's protocols identified various severity issues needing immediate fixes. One medium severity issue included a vulnerability to Flashloan Attack through a delayed harvest in the KeeperRewards Vault Function. Even though the success of this attack was deemed highly unlikely, it was recommended this vulnerability be addressed quickly. Low severity issues varied from incorrect typehash declarations affecting EIP-712 compliance to an issue with the UpdateRewards Function allowing unverified changes in KeeperRewards.sol. Additionally, problems with the enterExitQueue() function due to high share-to-asset ratios and the potential for unfair share gain during an early V2 to V3 migration were highlighted. While problematic, these vulnerabilities were deemed minor and the competition resulted in $15,999 in payouts to seven participants.

## Disclaimer


This report does not assert that the audited contracts are completely secure. Continuous review and comprehensive testing are advised before deploying critical smart contracts./n/n
The StakeWise audit competition illustrates the collaborative effort in identifying and rectifying potential vulnerabilities, enhancing the overall security and functionality of the platform.


Hats.finance does not provide any guarantee or warranty regarding the security of this project. All smart contract software should be used at the sole risk and responsibility of users.

