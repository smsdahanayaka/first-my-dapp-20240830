// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Voting {

    struct Candidate{
        string name;
        uint voteCount;
    } 

    struct Voter{
        bool isAuther;
        bool isVote;
        uint vote;
    }

    // GLOBAL VARIABLES
    string public electionName; 
    address public owner;
    uint public totalVote;
    Candidate[] public candidate_new;

    // CREATE MAPING
    mapping (address=>Voter) public voter_new;

    // CERATE MODIFIER
    modifier owner_only(){
        require(msg.sender==owner,"Only owner can call this function");
        _;
    }

    // FUNCTION OF CONSTRUCTOR
    constructor(string memory _name) {
        electionName = _name;
        owner = msg.sender;
    }

    // FUNCTION ADD CANDIDATES
    function addCandidate(string memory _name) public owner_only{
        candidate_new.push(Candidate(_name,0));
    }

    // 
    function autorize(address _address)public owner_only{
        voter_new[_address].isAuther=true;
    }

    // FUNCTION OF VOTE
    function vote(uint _voteIndex) public {
        require(!voter_new[msg.sender].isVote,"you have allredy voted");
        require(voter_new[msg.sender].isAuther,"You are not authorized to vote");
        
        voter_new[msg.sender].vote=_voteIndex;
        voter_new[msg.sender].isVote=true;

        candidate_new[_voteIndex].voteCount += 1;
        totalVote += 1;

    }

    // FUNCTION OF RETUN WINNING CANDIDATES
    function end() public owner_only view returns(uint winingcandidate){
        uint maxvote=0;
        for(uint i=0; i<candidate_new.length;i++){
            if(candidate_new[i].voteCount>maxvote){
                maxvote=candidate_new[i].voteCount;
                winingcandidate=i;
            }
        }
    }

}
