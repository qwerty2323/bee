#!/usr/bin/env ruby

require 'csv'

  
bee_efficiency = []

(1..15).each do |bee_id|

  dayrun = CSV.read("../data/harvest.csv", converters: :numeric)

  harvested = []  
  dayrun.select do |row|

    harvested << row[3] if row[0] == bee_id

  end

bee_efficiency << harvested.reduce(:+)/harvested.length

end

(0..14).each do |n|
  p "Number of the most efficient bee is #" + (n+1).to_s if bee_efficiency[n] == bee_efficiency.max
  p "Number of the least efficient bee is #" + (n+1).to_s if bee_efficiency[n] == bee_efficiency.min
end