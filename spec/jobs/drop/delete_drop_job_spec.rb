# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Drops::DeleteDropJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  describe '#perform' do
    context 'when Drop exists' do
      let!(:drop) { FactoryBot.create(:drop) }

      it 'deletes the Drop' do
        expect do
          Drops::DeleteDropJob.perform_now(drop_id: drop.id)
        end.to change { Drop.count }.by(-1)
      end
    end

    context 'when Drop does not exist' do
      it 'returns nil' do
        expect do
          Drops::DeleteDropJob.perform_now(drop_id: 999)
        end.to change { Drop.count }.by(0)
      end
    end
  end
end
