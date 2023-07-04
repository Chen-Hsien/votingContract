// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract voting  is Ownable,ERC20 {


    struct votingStructure {
        string topic;
        string description;
    }

    struct votingTicketStructure {
        uint256 yes;
        uint256 no;
    }

    uint256 votingID = 0;
    mapping(address => bool) public adminWhiteList;
    mapping(uint256 => votingStructure) public votingTopic;
    mapping(uint256 => bool) public votingIDActive;
    mapping(uint256 => mapping(address => bool)) public hasVoted;
    mapping(uint256 => votingTicketStructure) public votingIDquantity;  
    mapping(uint256 => address[]) public yesVoters;
    mapping(uint256 => address[]) public noVoters;
    mapping(address => uint256) public rewards;
    
    constructor() ERC20("VotingPoint", "VOT") {
        adminWhiteList[msg.sender] = true;
    }

    modifier onlyadminWhiteList() {
        require(adminWhiteList[msg.sender], "You are not whitelisted!");
        _;
    }
    modifier topicActive(uint256 _votingID) {
        require(votingIDActive[_votingID], "Topic is not open!");
        _;
    }

    function addToadminWhiteList(address _address) public onlyOwner {
        adminWhiteList[_address] = true;
    }

    function removeFromadminWhiteList(address _address) public onlyOwner {
        adminWhiteList[_address] = false;
    }

    function addNewTopic(string calldata _topic, string calldata _description) public onlyadminWhiteList {
        votingStructure memory newTopic = votingStructure({
            topic: _topic,
            description: _description
        });

        votingTopic[votingID] = newTopic;
        ++votingID;
    }

    function openTopic(uint256 _topicID) public onlyadminWhiteList {
        require(votingIDActive[_topicID] == false, "Topic is already open");
        votingIDActive[_topicID] = true;
    }

function closeTopic(uint256 _topicID, bool _ans) public onlyadminWhiteList returns (votingTicketStructure memory){
    require(votingIDActive[_topicID] == true, "Topic is already close");
    votingIDActive[_topicID] = false;

    address[] storage winners;

    if (_ans) {
        winners = yesVoters[_topicID];
    } else {
        winners = noVoters[_topicID];
    }

    // Assign rewards to each winning voter
    for (uint i = 0; i < winners.length; i++) {
        rewards[winners[i]] += 10;
    }

    return votingIDquantity[_topicID];
}

    function voteTopic(uint256 _topicID, bool voteYes) public {
        require(votingIDActive[_topicID], "Topic is not active");
        require(!hasVoted[_topicID][msg.sender], "You have already voted on this topic!");
        hasVoted[_topicID][msg.sender] = true;
        if (voteYes) {
            yesVoters[_topicID].push(msg.sender);
            ++votingIDquantity[_topicID].yes;
        } else {
            noVoters[_topicID].push(msg.sender);
            ++votingIDquantity[_topicID].no;
        }
    }

    function claimReward() public {
        uint256 reward = rewards[msg.sender];

        require(reward > 0, "No rewards available");

        rewards[msg.sender] = 0;

        _mint(msg.sender, reward);
    }

}
