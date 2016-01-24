require 'rails_helper'

RSpec.describe Api::StadiumsController, :type => :controller do
  render_views
  let(:json) { JSON.parse(response.body) }
  describe "stadium" do
    before do
      FactoryGirl.create_list(:stadium, 10)
      @stadium=Stadium.offset(rand(Stadium.count)).first
      @stadium_id_random = @stadium.id
    end

    it 'returns the all stadiums' do
      get 'index', format: :json
      json[ "stadiums" ].each do |status|
        expect(status.keys).to contain_exactly("name", "address","capacity","stockBeers","priceBeer")
      end
      expect(json["stadiums"].size).to eq(10)
    end
    
    it 'show one stadum' do
      get 'show',format: :json,id:@stadium_id_random
      json[ "stadium" ].each do |column|
        expect(column[1]).to eq(@stadium[column[0]])
      end
    end

    it 'change priceBeer' do
      post "changePriceBeer", format: :json, id: @stadium_id_random,priceBeer: '100'
      price =Stadium.find(@stadium_id_random).priceBeer
      expect(price).to eq(100)
    end

  end
end
