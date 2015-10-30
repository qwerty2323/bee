#!/usr/bin/env ruby

require 'csv'

class Harvest
  attr_accessor :bee_id, :day, :pollen_id, :harvested

  
bee_efficiency = []

for bee_id in (1..15) do

  harvest = CSV.read("../data/harvest.csv", converters: :numeric)

  harvested = []  
  harvest.select do |row|

    harvested << row[3] if row[0] == bee_id

  end

bee_efficiency << harvested.reduce(:+)/harvested.length

end

for n in (0..14) do
  p "Number of the most efficient bee is #" + (n+1).to_s if bee_efficiency[n] == bee_efficiency.max
  p "Number of the least efficient bee is #" + (n+1).to_s if bee_efficiency[n] == bee_efficiency.min
end


end