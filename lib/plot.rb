#!/usr/bin/env ruby

require 'csv'
require 'gnuplot'

days = Array.new
mg = Array.new

csv = CSV.open("../data/harvest.csv", headers: :first_row, converters: :numeric)
csv.each do |row|
  days << row[1]
  mg << row[3]
end


dates = []
days.each {|n| dates << Date.strptime(n,"%Y-%m-%d")}

Gnuplot.open do |gp|
  Gnuplot::Plot.new( gp ) do |plot|
    plot.timefmt "'%Y-%m-%d'"
    plot.title  "Best Harvest Day"
    plot.xlabel "Time"
    plot.xdata "time"
    plot.xrange '["2013-04-01":"2013-06-01"]'
    plot.ylabel "Harvested"
    

    plot.data << Gnuplot::DataSet.new( [dates,mg] ) do |ds|
      ds.with = "points"
      ds.title = "Pollen harvested"
      ds.using = '1:2'
    end
  end
end