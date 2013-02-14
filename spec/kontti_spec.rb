require 'kontti'

describe Kontti::KonttiFun do
  it "returns kovonen-hentti for hevonen" do
    k = Kontti::KonttiFun.new
    k.change( "hevonen" ).should eq("kovonen-hentti")
  end
end
