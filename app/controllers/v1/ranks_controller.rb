class V1::RanksController < ApplicationController
  def index
    rank = Rank.where(category_id: params[:category_id]).last

    if rank
      render json: { date: rank.result_date, items: rank.items }, status: 200
    else
      render json: {}, status: 204
    end
  end
end
