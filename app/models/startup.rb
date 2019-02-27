class Startup
  attr_reader :name, :founder, :domain
  attr_accessor :domain
  @@all = []
  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end
  def pivot(domain, name)
    @domain = domain
    @name = name
  end
  def self.all
    @@all
  end
  def self.find_by_founder(founder)
    @@all.find {|startup| startup.founder == founder}
  end
  def self.domains
    @@all.map {|startup| startup.domain}
  end
  def sign_contract(venture_capitalist, investment_type, investment_amount)
    FundingRound.new(self, venture_capitalist, investment_type, investment_amount)
  end
  def all_rounds
    FundingRound.all.select {|round| round.startup == self}
  end
  def num_funding_rounds
    all_rounds.count
  end
  def total_funds
    all_rounds.sum {|a| a.investment}
  end
  def investors
    all_rounds.map {|a| a.venture_capitalist}
  end
  def big_investors
    investors.uniq.select {|a| VentureCapitalist.tres_commas_club.include?(a)}
  end
end
