import React from 'react';

function Result({ candidates }) {
    return (
        <div>
            <h3>Results</h3>
            <ul className="list-group">
                {candidates.map((candidate, index) => (
                    <li key={index} className="list-group-item">
                        {candidate.name}: {candidate.voteCount} votes
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default Result;
