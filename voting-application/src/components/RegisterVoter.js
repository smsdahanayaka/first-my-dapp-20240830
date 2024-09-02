import React, { useState } from "react";

function RegisterVoter() {
const [address,setAddress]=useState('');
const [viewAdd,viewAddress]=useState('');

    const getAddressInput=(e)=>{
        // seAddress(e.target.values);
        setAddress(e.target.value); 
    }

    const btnClick =()=>{
        viewAddress(address);
    }

  return (
    <div>
      <h1>Register Voter</h1>
      <label>Vater address : {viewAdd}</label>
      {/* <form> */}
        <input type="text" name="firstName" required placeholder="Voter Address" onChange={getAddressInput}/>
        <br />
        <button className="btn btn-primary" onClick={btnClick}>Submit</button>
      {/* </form> */}
    </div>
  );
}

export default RegisterVoter;
