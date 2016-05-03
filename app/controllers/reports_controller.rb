class ReportsController < ApplicationController
  # GET /reports
  def index
    @cookies = Cookie.all.reverse_order.limit(50)
  end
end
