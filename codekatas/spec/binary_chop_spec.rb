require 'spec_helper'
require 'binary_chop'

RSpec.describe "Binary chop" do

   it "Find the index of an integer in a simple array" do
    arr = [3,6,2,1,11]

    expect(binary_chop(6, arr)).to eq (1)
   end
end
