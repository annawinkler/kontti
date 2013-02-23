require 'hyphenate'

describe Hyphenate do

	it "returns ko deis san sa kaan for kodeissansakaan" do
		Hyphenate::tavuta( "kodeissansakaan" ).should eq("ko deis san sa kaan")
	end
end