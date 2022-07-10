# frozen_string_literal: true

# Controller for Drops
class DropsController < ApplicationController
  def create
    drop = Drop.create!(drop_params)

    render json: DropSerializer.new(drop).serializable_hash
  end

  def show
    drop = Drop.find_by(hex: params[:id])

    if drop.viewed_at?
      head :not_found
    else
      drop.viewed!

      render json: DropSerializer.new(drop).serializable_hash
    end
  end

  def destroy
    Drop.find_by(hex: params[:id]).destroy

    head :ok
  end

  private

  def drop_params
    params.permit(:description, :content)
  end
end
