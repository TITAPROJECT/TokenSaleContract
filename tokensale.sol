
/**
 * @title Crowdsale
 * @dev Crowdsale is a base contract for managing a token crowdsale.
 * Crowdsales have a start and end timestamps, where investors can make
 * token purchases and the crowdsale will assign them tokens based
 * on a token per ETH rate. Funds collected are forwarded 
 to a wallet
 * as they arrive.
 */

contract Crowdsale {
  using SafeMath for uint256;

  // uint256 durationInMinutes;
  // address where funds are collected
  address public wallet;
  // token address
  
  address public addressOfTokenUsedAsReward;

  // mapping (address => uint) public contributions;
  uint256 public weiRaised;
  event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

function Crowdsale() {
    // durationInMinutes = _durationInMinutes;
    //Here will come the checksum address we got

    tokenReward = token(addressOfTokenUsedAsReward);
  }
  // fallback function can be used to buy tokens

  function () payable {
    buyTokens(msg.sender);
  }

    require(beneficiary != 0x0);
    require(validPurchase());

    uint256 weiAmount = msg.value;

    forwardFunds();
  }

  // send ether to the fund collection wallet
  // override to create custom fund forwarding mechanisms
  function forwardFunds() internal {
    // wallet.transfer(msg.value);
    if (!wallet.send(msg.value)) {
      throw;
    }
  }

  function validPurchase() internal constant returns (bool) {
    bool withinPeriod = started;
    bool nonZeroPurchase = msg.value != 0;
    return withinPeriod && nonZeroPurchase;
  }
}
