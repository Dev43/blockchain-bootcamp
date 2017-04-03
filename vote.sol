// Tell the compiler which version of the compiler we are using
pragma solidity ^0.4.8;

/// @title Simple Voting Contract.
contract Ballot {

    event Voted(address who, uint voteCalc);
    event Donation(address from, address chair, uint amount);

    uint public balance = 0;
    address public chairperson;

  // This declares a new complex type which will
  // be used for variables later.
  // It will represent a single voter.
    struct Voter {
        uint weight; // weight is accumulated by delegation
        bool voted;  // if true, that person already voted
        address delegate; // person delegated to
        uint vote;   // index of the voted proposal
    }

    // This is a type for a single proposal.
    struct Proposal
    {
        bytes32 name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    // Modifiers allow us to write reusable code
    // they are especially good for authentication
    // the _; tells the compiler where to put the rest of the code
    modifier isCreator(){
      if(msg.sender != chairperson){
        throw;
      }
      _;
    }

    // This declares a state variable that
    // stores a `Voter` struct for each possible address.
    mapping(address => Voter) public voters;

    // A dynamically-sized array of `Proposal` structs.
    Proposal[] public proposals;

    /// Create a new ballot to choose one of `proposalNames`.
    function Ballot(bytes32[] proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        // For each of the provided proposal names,
        // create a new proposal object and add it
        // to the end of the array.
        for (uint i = 0; i < proposalNames.length; i++) {
            // `Proposal({...})` creates a temporary
            // Proposal object and `proposals.push(...)`
            // appends it to the end of `proposals`.
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }
    /// Add another proposal to our array
    function addProposal(bytes32 newProposal){
        proposals.push(Proposal({
                name: newProposal,
                voteCount: 0
            }));
    }

    // Give `voter` the right to vote on this ballot.
    // May only be called by `chairperson`.
    function giveRightToVote(address voter) {
        if (msg.sender != chairperson || voters[voter].voted) {
            // `throw` terminates and reverts all changes to
            // the state and to Ether balances. It is often
            // a good idea to use this if functions are
            // called incorrectly. But watch out, this
            // will also consume all provided gas.
            throw;
        }
        voters[voter].weight = 1;
    }


    /// Give your vote (including votes delegated to you)
    /// to proposal `proposals[proposal].name`.
    function vote(uint proposal) {
        Voter sender = voters[msg.sender];
        if (sender.voted)
            throw;
        sender.voted = true;
        sender.vote = proposal;

        // If `proposal` is out of the range of the array,
        // this will throw automatically and revert all
        // changes.
        proposals[proposal].voteCount += sender.weight;
        // Send a message saying that we voted
        Voted(msg.sender,  proposals[proposal].voteCount);
    }

    /// Computes the winning proposal taking all
    /// previous votes into account.
    /// Notice the keyword 'constant', it won't need gas to run
    function winningProposal() constant
            returns (uint winningProposal)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal = p;
            }
        }
    }



    // Calls winningProposal() function to get the index
    // of the winner contained in the proposals array and then
    // returns the name of the winner
    function winnerName() constant
            returns (bytes32 winnerName)
    {
        winnerName = proposals[winningProposal()].name;
    }

    function donateToCreator() payable {
        Donation(msg.sender, chairperson, msg.value);
        balance += msg.value;
    }

    function creatorPayday() isCreator {
      uint toSend = balance;
      balance = 0;
      if(!msg.sender.send(toSend)){
        throw;
      }
    }

    function destroy() isCreator {
      selfdestruct(msg.sender);
    }
}