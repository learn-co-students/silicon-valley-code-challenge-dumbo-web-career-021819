require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

paypal = Startup.new("Paypal", "Elon Musk", "finance")
uber = Startup.new("Uber", "Tom Fields", "transportation")
Startup.find_by_founder("Tom Fields")
timmy = VentureCapitalist.new("Tim James", 382322928)
bob = VentureCapitalist.new("Bob Gatz", 2000000000)
jim = VentureCapitalist.new("Jim Halpert", 30000000)
invest = FundingRound.new(paypal, bob, "Angel", 5000000)
new_round = uber.sign_contract(bob,"2nd round", 34225.0)
new_round2 = uber.sign_contract(jim, "2nd round", 353646.0)
new_round3 = bob.offer_contract(paypal, "angel", 4325.2)
uber.num_funding_rounds
uber.total_funds
uber.investors
uber.big_investors
timmy.funding_rounds
bob.biggest_investment
bob.invested("finance")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
