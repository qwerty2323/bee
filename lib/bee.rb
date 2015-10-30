#!/usr/bin/env ruby

require 'csv'

=begin
       HARVEST
   1 - bee_id
   2 - day
   3 - pollen_id
   4 - harvested
       POLLENS
   1 - ID
   2 - name
   3 - sugar_per_mg  
   
=end





pollens = CSV.read("../data/pollens.csv")
