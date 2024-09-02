// import logo from './logo.svg';
import './App.css';
import Navbar from './components/Navbar';
import Loading from './components/Loading';
import RegisterVoter from './components/RegisterVoter';

function App() {
  return (
    <div className="App">
      <Navbar />
      <Loading />
      <RegisterVoter />``
      {/* <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header> */}
    </div>
  );
}

export default App;
