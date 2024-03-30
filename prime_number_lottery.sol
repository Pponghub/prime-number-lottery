// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract prime_lottery {
    uint[8] private win_number_pool = [2,3,5,7,11,13,17,19];
    uint private N = 0;
    uint private T1 = 0;
    uint private T2 = 0;
    uint private T3 = 0;
    uint private numPlayer = 0;
    uint private timeStart = 0;
    uint private reward = 0;
    address owner;
    mapping (address => uint) private player;//เก็บผู้เล่นตอนstage1ไว้
    mapping (address => uint) private playerPastPrime;//เก็บเลข prime ที่เคยได้ไปแล้ว
    mapping (uint => address) private noPlayer;//เก็บคนที่ผ่านกฏจริงๆ
    
    constructor (uint _N,uint _T1,uint _T2,uint _T3) payable  {
        require(_N >= 2,"not enough player ");
        N = _N;
        T1 = _T1;
        T2 = _T2 + _T1;
        T3 = _T3 + _T2 + _T1;
        owner = msg.sender;
    }

    function addPlayer() public payable{ 
        if(timeStart == 0){
            timeStart = block.timestamp;
        }
        require(block.timestamp - timeStart <= T1,"time out");
        require(msg.value == 1 ether,"not enough money");
        reward += msg.value;
        player[msg.sender] = 0;
    }

    function getPrime() public {
        require(T1 <= block.timestamp - timeStart && block.timestamp - timeStart <= T2,"time out");
        uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp,msg.sender)));
        for (uint256 i = 0; i < 10; i++) {
        player[msg.sender] = transaction;

    }


    function reset() public payable {
        require(block.timestamp - timeStart > T3);
        require(owner == msg.sender);
        
    }




}