pragma solidity 0.5.17;

contract Marry{

    string public FullNameFirst; // Name of the First person
    string public FullNameSecond; // Name of the Second person

// Function which marry two people  
function Married(string memory NameFirst,string memory NameSecond) public {
    FullNameFirst = NameFirst;
    FullNameSecond = NameSecond;
}

function Status() public view returns (string memory) {
    string memory Marrystatus;
    // Concat the names of the married
    Marrystatus = string.concat(FullNameFirst, "married to",FullNameSecond);
}
// Return the Marry Status
return Marrystatus;
}
