// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract KryptoBird is ERC721Connector{

    string[] public kryptoBirdz;

    mapping(string => bool) _kryptoBirdExists;

    function mint(string memory _kryptoBird) public {

        // uint _id = KryptoBirdz.push(_kryptoBird); //버전 문제
        require(!_kryptoBirdExists[_kryptoBird],
        'Error - kryptoBird already exists');
        kryptoBirdz.push(_kryptoBird);
        uint _id = kryptoBirdz.length - 1;


        _mint(msg.sender, _id);

        _kryptoBirdExists[_kryptoBird] = true;
    }

    constructor() ERC721Connector('KryptoBird', 'KBIRDZ'){

    }
}