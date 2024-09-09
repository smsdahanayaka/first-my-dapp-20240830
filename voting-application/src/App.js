import React, { useEffect, useState } from 'react';
import Navbar from './components/Navbar';
import Loading from './components/Loading';
import RegisterVoter from './components/RegisterVoter';

function App() {
    


    return (
        <div>
            <Navbar/>
            <div className="container mt-4">
                <Loading />
                <RegisterVoter/>
            </div>
        </div>
    );
}

export default App;
