require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
dorr = Startup.new('Dorr Enterprises', 'James Dorr', 'Domain Name')
watson = Startup.new('Watson Inc', 'Alyssa Watson', 'What is this?')
dorr2 = Startup.new('Dorr Enterprises2', 'James Dorr', 'Domain Name2')
james = VentureCapitalist.new('James Dorr', 10)
alyssa = VentureCapitalist.new('Alyssa Watson', 9_999_999_999)
jeff = VentureCapitalist.new('Jeff Watson', 1_000_000_001)
watson.sign_contract(james, 'pork', 1)
dorr.sign_contract(alyssa, 'jellyfish', 9999999)
dorr2.sign_contract(jeff, 'waterbottles', 200000000000)
dorr.sign_contract(alyssa, 'jellyfish', 9999999)
james.offer_contract(watson, 'children\'s ideas', 30000)
watson.sign_contract(james, 'corn', 1)
watson.sign_contract(james, 'pidgeon transportation', 999999)
watson.sign_contract(alyssa, 'pidgeon transportation', 999999)
dorr.sign_contract(james, 'pidgeon transportation', 999999)


p james.invested('What is this?')
# binding.pry
0 #leave this here to ensure binding.pry isn't the last line
