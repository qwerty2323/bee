#!/usr/bin/env ruby

require 'csv'

pollen_names = []

CSV.foreach("../data/pollens.csv") do |row|
  pollen_names << row[1]
end
sums = []

(1..5).each do |pollen_id|

  harvest = CSV.read("../data/harvest.csv", converters: :numeric)

  pollens = []
  harvest.select do |row|

    pollens << row[3] if row[2] == pollen_id

  end

sums << pollens.reduce(:+)

end

(0..4).each do |n|
  p "The most sugar is produced from pollen of " + pollen_names[n+1] if sums[n] == sums.max
  p "The least sugar is produced from pollen of " + pollen_names[n+1] if sums[n] == sums.min
end