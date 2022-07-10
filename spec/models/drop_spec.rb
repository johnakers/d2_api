# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Drop, type: :model do
  describe '#viewed!' do
    let(:drop) { FactoryBot.create(:drop) }

    it 'sets #viewed_at' do
      drop.viewed!

      expect(drop.reload.viewed_at).not_to be_nil
    end
  end
end
