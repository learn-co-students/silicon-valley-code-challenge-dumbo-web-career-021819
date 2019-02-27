class VentureCapitalist
  attr_reader :name, :total_worth
  @@all = []
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end
  def self.all
    @@all
  end
  def self.tres_commas_club
    @@all.select {|vc| vc.total_worth > 1_000_000_000}
  end
  def offer_contract(startup, investment_type, investment_amount)
    FundingRound.new(startup, self, investment_type, investment_amount)
  end
  def funding_rounds
    FundingRound.all.select {|x| x.venture_capitalist == self}
  end
  def portfolio
    funding_rounds.map {|x| x.startup}.uniq
  end
  def biggest_investment
    funding_rounds.max {|x| x.investment}
  end
  def invested(domain)
    funding_rounds.select {|round| round.startup.domain == domain
    }.sum {|round| round.investment}
  end
end
