class VentureCapitalist

attr_reader :name
attr_accessor :total_worth
@@all = []

def initialize (name, total_worth)
  @name = name
  @total_worth = total_worth
  @@all << self
end

def offer_contract(startup, type, amount)
  FundingRound.new(startup, self, type, amount)
end

def funding_rounds
  FundingRound.all.select {|round| round.venture_capitalist == self}
end

def portfolio
  funding_rounds.map {|round| round.startup}
end

def biggest_investment
  total = 0
  big_round = 0
  funding_rounds.each do |round|
    if round.investment > total
      big_round = round
      total = round.investment
    end
  end
  return big_round
end

def invested(domain)
  domain_array = []
  funding_rounds.each do |round|
    if round.startup.domain == domain
      domain_array << round.investment
    end
  end
  domain_array.inject(0) {|sum,x| sum + x}
end

def self.all
  @@all
end

def self.tres_commas_club
  @@all.select do |capitalist|
    capitalist.total_worth > 1000000000
  end
end

end
