# encoding: utf-8

require 'kontti'

# How to run these tests:
# rspec spec/kontti_spec.rb 
describe Kontti::KonttiFun do
  it "returns kovonen-hentti for hevonen" do
    Kontti::KonttiFun.change( "hevonen" ).should eq("kovonen-hentti")
  end

  it "returns kon ontti keillä montti kauska hontti koti täntti for on meillä hauska täti" do
  	Kontti::KonttiFun.change( "on meillä hauska täti" ).should eq( "kon ontti keillä montti kauska hontti koti täntti" )
  end

  it "adds konnti after a word" do
  	Kontti::KonttiFun.add_konnti( "hevonen", Kontti::AFFIX ).should eq("hevonen-kontti")
  end

  it "returns an error if the keyword specified is not CVCC" do
  	expect { Kontti::KonttiFun.check_keyword( "evon" )}.to raise_error("Key word must be CVCC!")
  end

  it "returns true if the keyword specified is CVCC" do
  	 Kontti::KonttiFun.check_keyword( "kontti" ).should be_true
  end

end
