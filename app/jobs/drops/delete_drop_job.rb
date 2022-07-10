# frozen_string_literal: true

module Drops
  # Delete a Drop after its been viewed
  class DeleteDropJob < ApplicationJob
    queue_as :urgent

    def perform(*args)
      id = args.first[:drop_id]
      drop = Drop.find_by(id: id) # rubocop:disable Style/HashSyntax

      if drop.nil?
        Rails.logger.info("Drop: #{id}, already deleted")
        return
      end

      drop.destroy
    end
  end
end
