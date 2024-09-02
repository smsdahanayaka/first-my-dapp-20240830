import Web3 from 'web3';

let web3;

if (window.ethereum) {
    web3 = new Web3(window.ethereum);
    window.ethereum.enable(); // Request account access if needed
} else if (window.web3) {
    web3 = new Web3(window.web3.currentProvider);
} else {
    // If no injected web3 instance is detected, fall back to Ganache
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
}

export default web3;
