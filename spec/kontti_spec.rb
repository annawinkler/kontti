require 'kontti'

# How to run these tests:
# rspec spec/kontti_spec.rb 
describe Kontti::KonttiFun do
  it "returns kovonen-hentti for hevonen" do
    k = Kontti::KonttiFun.new
    k.change( "hevonen" ).should eq("kovonen-hentti")
  end

  it "adds konnti after a word" do
  	k = Kontti::KonttiFun.new
  	k.add_konnti( "hevonen" ).should eq("hevonen-kontti")
  end
end
