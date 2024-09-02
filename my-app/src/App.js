import React, { useEffect, useState } from "react";
import Web3 from "web3";
import My_App from "./build/contracts/My_App.json";

function App() {
  const [account, setAccount] = useState("");
  const [contract, setContract] = useState(null);
  const [display_val, setDisplay] = useState({ name: "", age: "" });
  const [name_val, setNameVal] = useState("");
  const [age_val, setAgeVal] = useState("");
  const [data_val, setDataVal] = useState({ name: "", age: "" });

  useEffect(() => {
    const loadblockChain = async () => {
      // Initialize web3
      const web3 = new Web3(Web3.givenProvider || "http://127.0.0.1:7545");

      // Fetch accounts
      const accounts = await web3.eth.getAccounts();
      console.log(accounts[0]);
      setAccount(accounts[0]);

      // Get the network ID
      const netId = await web3.eth.net.getId(); // Add await to ensure it waits for the network ID
      console.log(netId);

      // Fetch contract instance
      const deployednetwork = My_App.networks[netId];
      if (deployednetwork) {
        const contractInstance = new web3.eth.Contract(
          My_App.abi,
          deployednetwork && deployednetwork.address
        );
        setContract(contractInstance);
      } else {
        console.error("Contract not deployed to detected network.");
      }
    };

    loadblockChain();
  }, []);

  const setName = (e) => {
    setNameVal(e.target.value);
  };
  const setAge = (e) => {
    setAgeVal(e.target.value);
  };
  const display = () => {
    setDisplay({ name: name_val, age: age_val });
    updateContract();
  };

  const updateContract = async () => {
    await contract.methods.setValue(name_val, parseInt(age_val)).send({ from: account });
    // Get values from the contract
    const data = await contract.methods.getValue().call();
    console.log("Data returned from contract:", data);

    // Handle if data is an object with properties
    // setDataVal({ name: data[0], age: data[1] });
    // Extract values from the data array
    const [age, name] = data;
    setDataVal({ name, age });
  };

  return (
    <div>
      <div>
        <h1>Blockchain App</h1>
        <p>Account: {account}</p>
        <label>input your namr</label>
        <input type="text" className="input_name" onChange={setName} />
        <label>input your age</label>
        <input type="text" className="input_age" onChange={setAge} />
      </div>
      <button onClick={display}>submit</button>
      <div>
        <p>name: {display_val.name}</p>
        <p>age: {display_val.age}</p>
        <p>Contract Name: {data_val.name}</p>
        <p>Contract Age: {data_val.age}</p>
      </div>
    </div>
  );
}

export default App;
