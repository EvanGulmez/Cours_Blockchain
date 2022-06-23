pragma solidity 0.8.15;

contract Marry{

    string public FullNameFirst; // Name of the First person
    string public FullNameSecond; // Name of the Second person


// Function which marry two people  
function Married(string memory NameFirst,string memory NameSecond) public {
    FullNameFirst = NameFirst; // Name of the First person
    FullNameSecond = NameSecond; // Name of the Second person
}
// Function that returns names and status of married
function Status() public view returns (string memory) {
    // Concat the names of the married
    string memory Marrystatus = string.concat(FullNameFirst, "married to",FullNameSecond);
// Return the Marry Status
return Marrystatus;
}
}
