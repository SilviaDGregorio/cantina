require 'rails_helper'

RSpec.describe Api::SalesController, :type => :controller do
  render_views
  let(:json) { JSON.parse(response.body) }
  describe "sales" do
    before do
      FactoryGirl.create_list(:sale, 10)
      FactoryGirl.create_list(:stadium,10,stockBeers: 100)
      @stadium=Stadium.offset(rand(Stadium.count)).first
      @stadium_id_random = @stadium.id
    end
    after do
      @stadium.destroy
    end

    it 'sell 9 beers successfully' do
      beersOnStock = @stadium.stockBeers.to_i - 10
      post 'saleBeers', format: :json, stadium_id: @stadium_id_random, numberBeers: 10
      stadium_before= Stadium.find(@stadium_id_random);
      expect( json['response']['error']).to eq(false)
      expect(stadium_before.stockBeers).to eq(beersOnStock);
    end

    it 'sell more beer than there are on stock' do
      beersOnStock = @stadium.stockBeers.to_i - 1000
      post 'saleBeers', format: :json, stadium_id: @stadium_id_random, numberBeers: 1000
      stadium_before= Stadium.find(@stadium_id_random);
      expect( json['response']['error']).to eq(true)
      expect(stadium_before.stockBeers).to eq(@stadium.stockBeers);
    end

    it 'check price for sell' do
      post 'saleBeers', format: :json, stadium_id: @stadium_id_random, numberBeers: 10
      priceSell = 10 * (@stadium.priceBeer.to_i)
      sale_id = json['response']['id']
      sale=@stadium.sales.find(sale_id)
      expect(sale.price).to eq(priceSell)
    end

    it 'add 9 beers successfully' do
      beersOnStock = @stadium.stockBeers.to_i + 9
      post 'addBeers', format: :json, stadium_id: @stadium_id_random, numberBeers: 9
      stadium_before= Stadium.find(@stadium_id_random);
      expect( json['response']['error']).to eq(false)
      expect(stadium_before.stockBeers).to eq(beersOnStock);
    end

    it 'check price for add stock' do
      post 'addBeers', format: :json, stadium_id: @stadium_id_random, numberBeers: 10
      priceSell = 10 * (@stadium.priceBeer.to_i/10)
      sale_id = json['response']['id']
      sale=@stadium.sales.find(sale_id)
      expect(sale.price).to eq(priceSell)
    end
  end
end
