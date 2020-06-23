class Startup

attr_reader :founder
attr_accessor :name, :domain
@@all = []

def initialize(name, founder, domain)
  @name = name
  @founder = founder
  @domain = domain
  @@all << self
end

def pivot(new_domain, new_name)
  @name = new_name
  @domain = new_domain
end

def sign_contract(vc, inv_type, amount)
  FundingRound.new(self, vc, inv_type, amount)
end

def funding_rounds
  FundingRound.all.select{|round| round.startup == self}
end

def num_funding_rounds
  funding_rounds.length
end

def total_funds
  funding_rounds.map {|round| round.investment}.inject(0){|sum,x| sum + x}
end

def investors
  funding_rounds.map {|round| round.venture_capitalist}
end

def big_investors
  new_array = []
  investors.each do |investor|
    if investor.total_worth > 1000000000
      new_array << investor
    end
  end
  new_array
end

def self.all
  @@all
end

def self.find_by_founder(founder_name)
  @@all.find {|startup| startup.founder == founder_name}
end

def self.domains()
  @@all.map {|startup| startup.domain}
end

end
