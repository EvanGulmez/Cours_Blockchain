pragma solidity ^0.5.7;

contract Code {
    uint256 private vcode;
    constructor(uint256  _vcode) public {
        vcode = _vcode;
    }
    function getmessage() public view returns (uint256 ){
        return vcode;
    }
    function setmessage(uint256  _vcode) public {
        vcode = _vcode;
    }
}