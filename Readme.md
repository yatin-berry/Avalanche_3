
# Create and Mint Tokens


This project demonstrates how to create, deploy, and interact with an ERC20 token smart contract usingRemix. The contract allows the owner to mint tokens to a provided address, and any user can burn or transfer tokens.


## Features
* Minting Tokens: The contract owner can mint new tokens to a specific address.
* Burning Tokens: Any user holding tokens can burn them to reduce the total supply.
* Transferring Tokens: Users can transfer tokens between addresses.
## Contract Details
* Contract Name: MyToken
* Token Name: Yatin
* Token Symbol: YA
* Total Supply: Initially, the total supply is set to zero
## Functions

     modifier onlyOwner(){
        require(owner == msg.sender , "Only owner can do this");
        _;
    }
The `onlyOwner` modifier ensures that only the contract owner (the address stored in owner) can execute certain functions, by checking if msg.sender is the owner; if not, it reverts with the message "Only owner can do this."

    //mint()
    function mint(address account, uint256 _val) public onlyOwner{
        totalsupply += _val;
        balances[account] += _val;
    }

This function allows the contract owner to mint new tokens and assign them to a specific account. It increases the totalsupply of tokens by _val and adds the minted tokens to the balance of the specified account. The `nlyOwner` modifier ensures that only the owner can call this function
 

    //transfer()
    function transfer(address fromA, address toB, uint256 _val) external{
        require(fromA != address(0), "Invalid sender address");
        require(toB != address(0), "Invalid reciever address");
        require(balances[fromA] >= _val, "Insufficient balance");
        balances[fromA] -= _val;
        balances[toB] += _val;
    }

This function allows tokens to be transferred from one address (fromA) to another (toB).
It checks:
* fromA is not the zero address (0x0).
* toB is not the zero address.
* The sender's balance is sufficient to make the transfer.
If all conditions are met, it deducts _val tokens from fromA and adds them to toB

    //burn()

  
    function burn(uint _val) public {
        require(balances[msg.sender] >= _val, "Insufficient balance");
  
        totalsupply -= _val;
  
        balances[msg.sender] -= _val;
  
   }
   

This function allows any user to burn (destroy) a specified number of their tokens.
It checks if the caller (msg.sender) has enough balance to burn the tokens.
If they do, it reduces the totalsupply by _val and decreases the caller's balance accordingly.
