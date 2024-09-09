import React,{useState} from "react";

function RegisterVoter(){
    const [input_val,setInputVal]=useState("");
    const [view_val,getInputVal]=useState("");

    const registerVoter =()=>{
        getInputVal(input_val);
    }
    const changeText =(e)=>{
        setInputVal(e.target.value);
    }

    return (
        <div>
            <h1>Register Voter</h1>
            {/* <form onSubmit={registerVoter}> */}
                <label>{view_val}</label>
                <input type="text" onChange={changeText} placeholder="enter your address" required />
                <button onClick={registerVoter} type="submit" className="btn btn-primary">REGISTER</button>
            {/* </form> */}
        </div>
    );
}

export default RegisterVoter;