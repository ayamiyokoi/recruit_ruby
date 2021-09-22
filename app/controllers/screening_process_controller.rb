class ScreeningProcessController < ApplicationController
  PER_PAGE = 10
  
  def index
    @companies = Company.joins(:events).where(events: { name: 1 }, user_id: current_user.id, is_active: true).order(id: "DESC").page(params[:page]).per(PER_PAGE)
    @companies_done = Company.joins(:events).where(events: { name: 1 }, user_id: current_user.id, is_active: false).order(id: "DESC").page(params[:page]).per(PER_PAGE)
  end
end
