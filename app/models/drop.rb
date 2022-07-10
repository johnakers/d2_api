# frozen_string_literal: true

# Model from Drop
class Drop < ApplicationRecord
  before_create :set_hex!
  after_create :enqueue_drop_delete!

  def viewed!
    update!(viewed_at: DateTime.now.utc)

    Drops::DeleteDropJob.perform_later(id: id) # rubocop:disable Style/HashSyntax
  end

  private

  def set_hex!
    hex = SecureRandom.hex(10)

    set_hex! if Drop.find_by(hex: hex) # rubocop:disable Style/HashSyntax

    self.hex = hex
  end

  def enqueue_drop_delete!
    Drops::DeleteDropJob.set(wait: 1.day).perform_later(drop_id: id)
  end
end
