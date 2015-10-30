require 'spec_helper'
require 'plot'
require 'harvest'
require '../../data/harvest.csv'

describe plot do
  it "should get data" do
    expect(days).should_not be_empty?
    expect(mg).should_not be_empty?
  end	
end