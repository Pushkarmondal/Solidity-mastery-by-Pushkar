// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Event {
    struct _event {
        address organizer;
        string name;
        uint date;
        uint price;
        uint ticket;
        uint remainTicket;
    }

    mapping(uint  => _event) public events;

    mapping (address => mapping (uint => uint)) public tickets;

    uint public next;

    function _Event(string memory name, uint date, uint price, uint ticket) public {
        require(date > block.timestamp, "Not valid");
        require(ticket > 0, "wtf 0 ticket");
        events[next] = _event(msg.sender, name, date, price, ticket, ticket);
        next++;
    }

    function buyTicket(uint id, uint total) public payable{
      require(events[id].date != 0, "Doesnot exist");
      _event storage eve = events[id];
      require(msg.value == eve.price * total, "Not pay");
      require(eve.remainTicket >= total, "Not enough ticket");
      eve.remainTicket -= total;
      tickets[msg.sender][id]+=total;
    }
}