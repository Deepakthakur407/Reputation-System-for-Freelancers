// SPDX-License-Identifier:
pragma solidity ^0.8.18;

contract Project {
    struct Freelancer {
        uint256 totalRating;
        uint256 numRatings;
    }

    mapping(address => Freelancer) public freelancers;
    mapping(address => mapping(address => bool)) public hasRated;

    function rateFreelancer(address _freelancer, uint8 _rating) external {
        require(_rating >= 1 && _rating <= 5, "Rating must be 1-5");
        require(!hasRated[msg.sender][_freelancer], "Already rated");

        freelancers[_freelancer].totalRating += _rating;
        freelancers[_freelancer].numRatings += 1;
        hasRated[msg.sender][_freelancer] = true;
    }

    function getAverageRating(address _freelancer) external view returns (uint256) {
        Freelancer memory f = freelancers[_freelancer];
        if (f.numRatings == 0) return 0;
        return f.totalRating / f.numRatings;
    }
}






