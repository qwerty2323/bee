#!/usr/bin/env ruby

require 'csv'

class Pollen
	attr_accessor :pollen_id, :name, :sugar


	pollen_names = []

	CSV.foreach("../data/pollens.csv") do |row|
	  pollen_names << row[1]
	end
	sums = []

	for pollen_id in (1..5) do

	  harvest = CSV.read("../data/harvest.csv", converters: :numeric)

	  pollens = []
	  harvest.select do |row|

	    pollens << row[3] if row[2] == pollen_id

	  end

	sums << pollens.reduce(:+)

	end

	for n in (0..4) do
	  p "The most sugar is produced from pollen of " + pollen_names[n+1] if sums[n] == sums.max
	  p "The least sugar is produced from pollen of " + pollen_names[n+1] if sums[n] == sums.min
	end

end