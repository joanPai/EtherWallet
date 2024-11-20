// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private s_storage;
    uint256[] private s_plentyStorage;

    // user can view the storage w/o sending money
    function getStorage() public view returns (uint256) {
        return s_storage;
    }

    // user needs to send money to change code
    function setStorage(uint256 _storage) public {
        s_storage = _storage;
    }

    function ifEsleStatement() public view returns (bool) {
        if (s_storage == 0) {
            return true;
        }
        if (s_storage > 1) {
            return false;
        } else {
            return false;
        }
    }

    function looper() public {
        for (uint256 i = 0; i < s_plentyStorage.length; i++) {
            s_plentyStorage[i] = i;
        }
    }
}

contract Finances{
    
    
    struct UserProfile{
        string name;
        uint age;
        address userAddress;
    }

    mapping(address  => UserProfile ) private s_userProfile;

    function setUserProfile(string memory name, uint age, address user ) public{
        s_userProfile[user] = UserProfile(name, age, user);
    }
        function getUserProfile(address user) public view returns(UserProfile memory){
        return s_userProfile[user];
        }
    

}
