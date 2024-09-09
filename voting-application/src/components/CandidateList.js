import React from 'react';

function CandidateList({ candidates }) {
    return (
        <div>
            <h3>Candidates</h3>
            <ul className="list-group">
                {candidates.map((candidate, index) => (
                    <li key={index} className="list-group-item">
                        {candidate.name} - {candidate.voteCount} votes
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default CandidateList;
