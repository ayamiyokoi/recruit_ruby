class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  PER_PAGE = 10

  # GET /companies or /companies.json
  def index
    @companies = Company.where(user_id: current_user.id, is_active: true).order(id: "DESC").page(params[:page]).per(PER_PAGE)
    @companies_done = Company.where(user_id: current_user.id, is_active: false).order(id: "DESC").page(params[:page]).per(PER_PAGE)
  end

  # GET /companies/1 or /companies/1.json
  def show
    if @company.user == current_user
      render "show"
    else
      redirect_to root_path
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    if @company.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    @accept_conditions = AcceptCondition.where(user_id: current_user.id)
    respond_to do |format|
      if @company.save
        @accept_conditions.each do |accept_condition|
          check = Check.new
          check.company_id = @company.id
          check.accept_condition_id = accept_condition.id
          check.accept = 'no_evidence'
          check.save
        end
        format.html { redirect_to @company, notice: "企業の作成に成功しました。" }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: "企業の更新に成功しました。" }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "企業の削除に成功しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:user_id, :name, :media, :job, :detail, :is_active)
    end
end
