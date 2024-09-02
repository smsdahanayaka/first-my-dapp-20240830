// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract My_App {
    string name;
    int age;

    function setValue(string memory _name, int _age) public {
        name = _name;
        age = _age;
    }

    function getValue() public view returns (int, string memory) {
        return (age, name);
    }
}
