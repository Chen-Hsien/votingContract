# votingContract
## Feature Description
1. Setting up an admin role:
Set up a specific admin role that has special permissions such as initiating or ending a new topic for voting.  

2. Admin can start or close a new topic for voting:
The admin should be able to start or conclude a voting period for a specific topic.  

3. Each voting topic can have a theme and description fields:
Each topic of the vote should be able to be defined with a title and a descriptive field to provide more context.  

4. Everyone can vote once the voting is opened (each person can only vote once on each topic):
Once the voting period for a topic is open, everyone should be able to cast their vote. Each participant should only be allowed to vote once per topic.  

5. Calculate voting results when closing the vote:
When the voting period ends, the contract should be able to calculate the results of the vote.  

6. Reward those who voted correctly with points / ERC20 tokens according to the results:
According to the voting results, those who voted correctly should be rewarded with some form of points or ERC20 tokens.  

# Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

## Slither
Slither is a Solidity static analysis framework. It runs a suite of vulnerability detectors, prints visual information about contract details.  
Slither enables developers to find vulnerabilities, enhance their code comphrehension, and quickly prototype custom analyses.

```shell
slither . --print human-summary

Total number of contracts in source files: 1
Number of contracts in dependencies: 5
Source lines of code (SLOC) in source files: 83
Source lines of code (SLOC) in dependencies: 173
Number of  assembly lines: 0
Number of optimization issues: 0
Number of informational issues: 20
Number of low issues: 0
Number of medium issues: 0
Number of high issues: 0


Use: Openzeppelin-Ownable, Openzeppelin-ERC20
ERCs: ERC20

+--------+-------------+-------+--------------------+--------------+----------+
|  Name  | # functions |  ERCS |     ERC20 info     | Complex code | Features |
+--------+-------------+-------+--------------------+--------------+----------+
| voting |      45     | ERC20 |     No Minting     |      No      |          |
|        |             |       | Approve Race Cond. |              |          |
|        |             |       |                    |              |          |
+--------+-------------+-------+--------------------+--------------+----------+
INFO:Slither:. analyzed (6 contracts)
```

