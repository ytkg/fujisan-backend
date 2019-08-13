class V1::RanksController < ApplicationController
  def index
    ranks = Rank.where(category_id: params[:category_id]).order(result_date: :desc).page(params[:page]).per(1)

    if ranks.present?
      render json: { date: ranks.first.result_date, items: ranks.first.items, next_page: ranks.next_page }, status: 200
    else
      render json: {}, status: 204
    end
  end
end
