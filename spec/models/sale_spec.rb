require "rails_helper"

RSpec.describe Sale, :type => :model do
	describe "validate sale" do
		it "should have valid factory" do
    		expect(FactoryGirl.build(:sale)).to be_valid
		end
		it "should require a n_beers" do
    		expect(FactoryGirl.build(:sale, :n_beers => nil)).to be_invalid
		end
		it "should require a price" do
    		expect(FactoryGirl.build(:sale, :price => nil)).to be_invalid
		end
		it "should require a type_transaction" do
    		expect(FactoryGirl.build(:sale, :type_transaction => nil)).to be_invalid
		end
	end
end