pragma solidity 0.4.24;
import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol"  ;
    contract VenovaCrowdsale is Crowdsale, TimedCrowdsale, CappedCrowdsale, MintedCrowdsale {
    uint256 public investorMinCap = 2000000000000000; // 0.002 ether
    uint256 public investorHardCap = 1000000000000000000; // 1 ether
    mapping(address => uint256) public contributions;
    constructor
    (
        uint256 _rate,
        address _wallet,
        ERC20 _token,
        uint256 _openingTime,
        uint256 _closingTime,
        uint256 _cap
    ) 
        Crowdsale(_rate, _wallet, _token)
        TimedCrowdsale(_openingTime, _closingTime)
        CappedCrowdsale(_cap)
        public
    {
    }
    
  /**
   * @dev enables token transfers, called when owner calls finalize()
  */
  // function finalization() internal {
  //   if(goalReached()) {
  //     MintableToken _mintableToken = MintableToken(token);
  //     uint256 _alreadyMinted = _mintableToken.totalSupply();
  //     uint256 _finalTotalSupply = _alreadyMinted.div(tokenSalePercentage).mul(100);
  //     foundersTimelock   = new TokenTimelock(token, foundersFund, releaseTime);
  //     foundationTimelock = new TokenTimelock(token, foundationFund, releaseTime);
  //     partnersTimelock   = new TokenTimelock(token, partnersFund, releaseTime);
  //     _mintableToken.mint(address(foundersTimelock),   _finalTotalSupply.mul(foundersPercentage).div(100));
  //     _mintableToken.mint(address(foundationTimelock), _finalTotalSupply.mul(foundationPercentage).div(100));
  //     _mintableToken.mint(address(partnersTimelock),   _finalTotalSupply.mul(partnersPercentage).div(100));
  //     _mintableToken.finishMinting();
  //     // Unpause the token
  //     PausableToken _pausableToken = PausableToken(token);
  //     _pausableToken.unpause();
  //     _pausableToken.transferOwnership(wallet);
  //   }
  //   super.finalization();
  // }
}