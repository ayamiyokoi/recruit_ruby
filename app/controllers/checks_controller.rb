class ChecksController < ApplicationController
  before_action :set_check, only: %i[ show edit update destroy ]
  before_action :set_company, only: %i[ index new edit create ]
  before_action :set_accept_condition, only: %i[ new edit create ]
  PER_PAGE = 10

  # GET /checks or /checks.json
  def index
    @checks = Check.joins(:accept_condition).where(company_id: params[:company_id]).order(importance: "DESC").page(params[:page]).per(PER_PAGE)
    if Company.find(params[:company_id]).user == current_user
      render "index"
    else
      redirect_to root_path
    end
  #   @company = Company.find(params[:company_id])
  end

  # GET /checks/new
  def new
    @check = Check.new
    # @company = Company.find(params[:company_id])
    # @accept_conditions = AcceptCondition.where(user_id: current_user.id)
  end

  # GET /checks/1/edit
  def edit
    # @company = Company.find(params[:company_id])
    # @accept_conditions = AcceptCondition.where(user_id: current_user.id)
  end

  # POST /checks or /checks.json
  def create
    # @accept_conditions = AcceptCondition.where(user_id: current_user.id)
    # @company = Company.find(params[:company_id])
    @check = Check.new(check_params)
    @check.company_id = params[:company_id]
    respond_to do |format|
      if @check.save
        format.html { redirect_to company_checks_path(company_id: params[:company_id]), notice: "志望度チェックの作成に成功しました。" }
        format.json { redirect_to company_checks_path(company_id: params[:company_id]), status: :created, location: @check }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checks/1 or /checks/1.json
  def update
    respond_to do |format|
      if @check.update(check_params)
        format.html { redirect_to company_checks_path(company_id: params[:company_id]), notice: "志望度チェックの更新に成功しました。" }
        format.json { render redirect_to company_checks_path(company_id: params[:company_id]), status: :ok, location: @check }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checks/1 or /checks/1.json
  def destroy
    @check.destroy
    respond_to do |format|
      format.html { redirect_to checks_url, notice: "志望度チェックの削除に成功しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @check = Check.find(params[:id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_accept_condition
      @accept_conditions = AcceptCondition.where(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def check_params
      params.require(:check).permit(:company_id, :accept_condition_id, :accept)
    end
end

