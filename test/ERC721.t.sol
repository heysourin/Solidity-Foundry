// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/ERC721.sol";

contract TokenContractTest is Test {
    ERC721 public erc721;
    MyNFT public myNFT;

    address bob = address(0x1);
    address mary = address(0x2);

    function testMintToken() public {
        myNFT = new MyNFT();
        myNFT.mint(bob, 0);

        address owner_of = myNFT.ownerOf(0); // As myNFT contract inheriting from ERC721 contract.
        assertEq(bob, owner_of);
    }

    function testTransferToken() public {
        myNFT = new MyNFT();
        myNFT.mint(bob, 0);

        //Todo: We are starting to act as Bob. This part kindof acting like 'msg.sender'
        vm.startPrank(bob);
        myNFT.safeTransferFrom(bob, mary, 0);

        //Todo: Checkinng the new owner after the transfer.
        address owner_of = myNFT.ownerOf(0);
        assertEq(mary, owner_of);
    }

    function testGetBalance() public {
        myNFT = new MyNFT();

        myNFT.mint(bob, 0);
        myNFT.mint(bob, 1);
        myNFT.mint(bob, 2);
        myNFT.mint(bob, 3);
        myNFT.mint(bob, 4);

        uint balance = myNFT.balanceOf(bob);
        assertEq(balance, 5);
    }

    function testBurnToken() public {
        //Todo: See the contract, only owner can burn token
        myNFT = new MyNFT();

        myNFT.mint(bob, 9);

        //todo: As only Bob can burn token 9, we need to prank.And here we are just pretending to be Mary. This part kindof acting like 'msg.sender'

        /* vm.startPrank(bob); //Test should pass
        myNFT.burn(9); */

        //Testing to pass the fail tes
        vm.startPrank(mary);
        vm.expectRevert("not owner"); //Error msg is from the contract
        myNFT.burn(9);

        emit log_address(mary);
    }
}
