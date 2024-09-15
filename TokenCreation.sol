// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


    contract MyToken{
        string public tokenName = "YATIN";
        string public tokenAbb = "YA";
        uint public totalsupply = 0;
        address public owner =  msg.sender;
        mapping(address => uint) public balances;
    
    modifier onlyOwner(){
        require(owner == msg.sender , "Only owner can do this");
        _;
    }
    
    function mint(address account, uint256 _val) public onlyOwner{
        totalsupply += _val;
        balances[account] += _val;
    }

    function transfer(address fromA, address toB, uint256 _val) external{
        require(fromA != address(0), "Invalid sender address");
        require(toB != address(0), "Invalid reciever address");
        require(balances[fromA] >= _val, "Insufficient balance");
        balances[fromA] -= _val;
        balances[toB] += _val;
    }
    
    function burn(uint _val) public {
        require(balances[msg.sender] >= _val, "Insufficient balance");
        totalsupply -= _val;
        balances[msg.sender] -= _val;
   } 
}
