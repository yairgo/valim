require 'spec_helper'

describe "Broficiation" do
  it "should brotate rotate" do
    "rotate".brotate.should == "brotate"
  end

  it "should brotate josé" do
    "josé".brotate.should == "brosé"
  end

  it "should brotate phrases" do
    "Poseidon, king of the ocean".brotate.should ==
      "Broseidon, king of the brocean"
  end
end