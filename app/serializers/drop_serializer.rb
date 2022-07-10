# frozen_string_literal: true

# Serializer for Drop
class DropSerializer
  include JSONAPI::Serializer

  attributes :description, :content, :hex, :created_at
end
