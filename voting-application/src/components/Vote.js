import React, { useState } from 'react';

function Vote({ contract, account, candidates }) {
    const [selectedCandidate, setSelectedCandidate] = useState('');

    const vote = async (e) => {
        e.preventDefault();
        try {
            await contract.methods.vote(selectedCandidate).send({ from: account });
            alert("Vote Cast Successfully");
        } catch (error) {
            alert("Error: " + error.message);
        }
    };

    return (
        <div>
            <h3>Vote</h3>
            <form onSubmit={vote}>
                <select
                    value={selectedCandidate}
                    onChange={(e) => setSelectedCandidate(e.target.value)}
                    required
                >
                    <option value="">Select Candidate</option>
                    {candidates.map((candidate, index) => (
                        <option key={index} value={index}>
                            {candidate.name}
                        </option>
                    ))}
                </select>
                <button type="submit" className="btn btn-primary">Vote</button>
            </form>
        </div>
    );
}

export default Vote;
