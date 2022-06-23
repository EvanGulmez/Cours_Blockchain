pragma solidity ^0.5.0;

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// ----------------------------------------------------------------------------
contract ERC20Interface {
    // The maximum numbers of tokens
    function totalSupply() public view returns (uint);
    // Owner token count
    function balanceOf(address tokenOwner) public view returns (uint balance);
    // Return the amount remaining token of spender
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    // Transfer tokens to a destinary
    function transfer(address to, uint tokens) public returns (bool success);
    // Transfer approvement
    function approve(address spender, uint tokens) public returns (bool success);
    //Transfer tokens between two wallet address
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    
    // Event Transfer 
    event Transfer(address indexed from, address indexed to, uint tokens);
    // Event Approval
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// ----------------------------------------------------------------------------
// Safe Math Library
// ----------------------------------------------------------------------------
contract SafeMath {
    // Pure Fonction doesn’t read or modify the variables of the state. It can only use local variables that are declared in the function and the arguments that are passed to the function to compute or return a value.
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    //
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a); c = a - b; } function safeMul(uint a, uint b) public pure returns (uint c) { c = a * b; require(a == 0 || c / a == b); } function safeDiv(uint a, uint b) public pure returns (uint c) { require(b > 0);
        c = a / b;
    }
}

// Token inherits of ERC20Interface and SafeMath
contract TotallySpiesToken is ERC20Interface, SafeMath {
    string public name; // Token Name
    string public symbol; // Token Symbol
    uint8 public decimals; // 18 decimals is the strongly suggested default, avoid changing it

    uint256 public _totalSupply; // maximum numbers of tokens

    //mapping stored the balance of the address
    mapping(address => uint) balances;
    //stored per address the balance allowed 
    mapping(address => mapping(address => uint)) allowed;

// ----------------------------------------------------------------------------
//  * Constrctor function
//  *
//  * Initializes contract with initial supply tokens to the creator of the contract
// ----------------------------------------------------------------------------
    constructor() public {
        name = "TotallySpies"; // Token Name
        symbol = "SPY"; // Token Symbol
        decimals = 18; 
        _totalSupply = 100000000000000000000000000; // Max Suplly

        balances[msg.sender] = _totalSupply; // The balance of the owner take all the tokens
        emit Transfer(address(0), msg.sender, _totalSupply);// the first address is the owner 
    }
    //
    function totalSupply() public view returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
    //Balance of the owner
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
    //
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
    // Transaction Approvement
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    //Transfer token to an other account
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
    //Transfer token to an different account to an other account
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
}