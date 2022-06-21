pragma solidity >=0.4.22 <0.6.0;

contract MyToken{
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    /* Initializes contract with initial supply tokens to the creator of the contract */

    /* Send coins */
    function transfer(address _to,uint256 _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value); //Check the sender balance
        require(balanceOf[_to] + _value >= balanceOf[_to]); //Check for overflows
        balanceOf[msg.sender] -= _value; //Substract the amout from the sender
        balanceOf[_to] += _value; //Add the same to the recipient
        return true;
    }
}