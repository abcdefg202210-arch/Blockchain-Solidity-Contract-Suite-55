// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DAOGovernanceCore {
    struct Proposal {
        address proposer;
        string description;
        uint256 voteFor;
        uint256 voteAgainst;
        uint256 endTime;
        bool executed;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(address => mapping(uint256 => bool)) public hasVoted;
    uint256 public proposalCount;
    uint256 public votingPeriod = 3 days;
    address public immutable token;

    event ProposalCreated(uint256 id, string desc);
    event Voted(uint256 id, address voter, bool support);

    constructor(address _token) { token = _token; }

    function createProposal(string calldata desc) external {
        proposalCount++;
        proposals[proposalCount] = Proposal(msg.sender, desc, 0, 0, block.timestamp + votingPeriod, false);
        emit ProposalCreated(proposalCount, desc);
    }

    function vote(uint256 id, bool support) external {
        Proposal storage p = proposals[id];
        require(block.timestamp < p.endTime && !hasVoted[msg.sender][id], "Invalid vote");
        hasVoted[msg.sender][id] = true;
        support ? p.voteFor++ : p.voteAgainst++;
        emit Voted(id, msg.sender, support);
    }
}
