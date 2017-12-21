require 'rails_helper'

RSpec.describe Airport, type: :model do
  let!(:airport) { FactoryBot.create(:airport) }

  before(:all) do
    Time.zone = 'America/Los_Angeles'
  end

  describe '#address' do
    context 'when state and country are null' do
      it 'expect return address with city only' do
        airport.city = 'Test city'
        airport.state = nil
        airport.country = nil
        expect(airport.address).to eq('Test city')
      end
    end

    context 'when state and country are not null' do
      it 'expect return address with city, state, country' do
        airport.city = 'Test city'
        airport.state.name = 'Test state'
        airport.country.name = 'Test country'
        expect(airport.address).to eq('Test city, Test state, Test country')
      end
    end

    context 'when state is null' do
      it 'expect return address with city, country' do
        airport.city = 'Test city'
        airport.state = nil
        airport.country.name = 'Test country'
        expect(airport.address).to eq('Test city, Test country')
      end
    end

    context 'when country is null' do
      it 'expect return address with city, state' do
        airport.city = 'Test city'
        airport.state.name = 'Test state'
        airport.country = nil
        expect(airport.address).to eq('Test city, Test state')
      end
    end
  end
end
