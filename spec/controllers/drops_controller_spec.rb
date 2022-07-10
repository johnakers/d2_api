# frozen_string_literal: true

require 'rails_helper'

# Spec for DropController
RSpec.describe DropsController, type: :controller do
  describe '#create' do
    it 'creates a Drop' do
      expect do
        post :create, params: { description: 'hello', content: 'world' }
      end.to change { Drop.count }.by(1)
    end

    it 'returns :ok' do
      post :create, params: { description: 'hello', content: 'world' }

      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:drop) { FactoryBot.create(:drop) }

    context 'when Drop has not been viewed' do
      it 'returns a Drop' do
        get :show, params: { id: drop.hex }

        parsed = JSON.parse(response.body)

        expect(parsed['id'].to_i).to eq(drop.id)
      end
    end

    context 'when Drop has been viewed' do
      it 'returns not_found' do
        get :show, params: { id: drop.hex }

        get :show, params: { id: drop.hex }

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#destroy' do
    let!(:drop) { FactoryBot.create(:drop) }

    it 'destroys a Drop' do
      expect do
        post :destroy, params: { id: drop.hex }
      end.to change { Drop.count }.by(-1)
    end

    it 'returns :ok' do
      post :destroy, params: { id: drop.hex }

      expect(response).to have_http_status(:ok)
    end
  end
end
