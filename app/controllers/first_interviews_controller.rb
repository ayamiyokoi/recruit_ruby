class FirstInterviewsController < ApplicationController
  PER_PAGE = 10

  def index
    @companies = Company.joins(:events).where(events: { name: 2, is_passed: 0 }, user_id: current_user.id, is_active: true).order(id: "DESC").page(params[:page]).per(PER_PAGE)
    @companies_pass = Company.joins(:events).where(events: { name: 2, is_passed: 1 }, user_id: current_user.id).order(id: "DESC").page(params[:page]).per(PER_PAGE)
    @companies_drop = Company.joins(:events).where(events: { name: 2, is_passed: 2 }, user_id: current_user.id).order(id: "DESC").page(params[:page]).per(PER_PAGE)
  
  end
end
