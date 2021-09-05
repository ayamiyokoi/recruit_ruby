class ChecksController < ApplicationController
  before_action :set_check, only: %i[ show edit update destroy ]

  # GET /checks or /checks.json
  def index
    @checks = Check.where(company_id: params[:company_id])
    @company = Company.find(params[:company_id])
  end

  # GET /checks/new
  def new
    @check = Check.new
    @company = Company.find(params[:company_id])
    @accept_conditions = AcceptCondition.where(user_id: current_user.id)
  end

  # GET /checks/1/edit
  def edit
    @company = Company.find(params[:company_id])
    @accept_conditions = AcceptCondition.where(user_id: current_user.id)
  end

  # POST /checks or /checks.json
  def create
    @accept_conditions = AcceptCondition.where(user_id: current_user.id)
    @company = Company.find(params[:company_id])
    @check = Check.new(check_params)
    @check.company_id = params[:company_id]
    respond_to do |format|
      if @check.save
        format.html { redirect_to company_checks_path(company_id: params[:company_id]), notice: "Check was successfully created." }
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
        format.html { redirect_to company_checks_path(company_id: params[:company_id]), notice: "Check was successfully updated." }
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
      format.html { redirect_to checks_url, notice: "Check was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @check = Check.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def check_params
      params.require(:check).permit(:company_id, :accept_condition_id, :accept)
    end
end
