// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract CommitmentDevice {
    error CommitmentDevice__IndexOutOfBounds(uint256 index);

    uint256 public number;
    string[] public commitments;
    bool[] private _hasAchieved;
    uint256 public numberOfCommitments;

    constructor() {
        number = 0;
        numberOfCommitments = 0;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function addCommitment(string memory commitment) public {
        commitments.push(commitment);
        _hasAchieved.push(false); // Is this needed? Can remove if gas saved.
        numberOfCommitments++;
    }

    function editCommitment(uint256 index, string memory newCommitment) public {
        if (index < 0 || index >= numberOfCommitments) revert CommitmentDevice__IndexOutOfBounds(index);
        commitments[index] = newCommitment;
    }

    function removeCommitment(uint256 index) public {
        if (index < 0 || index >= numberOfCommitments) revert CommitmentDevice__IndexOutOfBounds(index);
        commitments[index] = commitments[numberOfCommitments - 1];
        commitments.pop();
        _hasAchieved[index] = _hasAchieved[numberOfCommitments - 1];
        _hasAchieved.pop();
        numberOfCommitments--;
    }

    function _hasAchievedCommitment(uint256 index) public view returns (bool) {
        if (index < 0 || index >= numberOfCommitments) revert CommitmentDevice__IndexOutOfBounds(index);
        return _hasAchieved[index];
    }
}
