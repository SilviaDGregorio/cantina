require "rails_helper"

RSpec.describe Stadium, :type => :model do
	describe "validate stadium" do
		it "should have valid factory" do
    		expect(FactoryGirl.build(:stadium)).to be_valid
		end
		it "should require a name" do
    		expect(FactoryGirl.build(:stadium, :name => nil)).to be_invalid
		end
		it "should require a capacity" do
    		expect(FactoryGirl.build(:stadium, :capacity => nil)).to be_invalid
		end
		it "should require a address" do
    		expect(FactoryGirl.build(:stadium, :address => nil)).to be_invalid
		end
		it "should require a stockBeers" do
			expect(FactoryGirl.build(:stadium, :stockBeers => nil)).to be_invalid
		end
		it "should require a priceBeer" do
			expect(FactoryGirl.build(:stadium, :priceBeer => nil)).to be_invalid
		end
		it "should require a uniqueness name" do
			stadium=FactoryGirl.create(:stadium)
			expect(FactoryGirl.build(:stadium, :name => stadium.name)).to be_invalid
		end
	end
end
