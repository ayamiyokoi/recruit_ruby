class AcceptConditionsController < ApplicationController
  before_action :set_accept_condition, only: %i[ show edit update destroy ]

  # GET /accept_conditions or /accept_conditions.json
  def index
    @accept_conditions = AcceptCondition.where(user_id: current_user.id)
  end

  # GET /accept_conditions/new
  def new
    @accept_condition = AcceptCondition.new
  end

  # GET /accept_conditions/1/edit
  def edit
  end

  # POST /accept_conditions or /accept_conditions.json
  def create
    @accept_condition = AcceptCondition.new(accept_condition_params)
    @accept_condition.user_id = current_user.id
    @companies = Company.where(user_id: current_user.id)

    respond_to do |format|
      if @accept_condition.save
         @companies.each do |company|
          check = Check.new
          check.company_id = company.id
          check.accept_condition_id = @accept_condition.id
          check.accept = 'no_evidence'
          check.save
        end
        format.html { redirect_to accept_conditions_path, notice: "Accept condition was successfully created." }
        format.json { render :index, status: :created, location: @accept_condition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accept_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accept_conditions/1 or /accept_conditions/1.json
  def update
    respond_to do |format|
      if @accept_condition.update(accept_condition_params)
        format.html { redirect_to accept_conditions_path, notice: "Accept condition was successfully updated." }
        format.json { render :index, status: :ok, location: @accept_condition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accept_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accept_conditions/1 or /accept_conditions/1.json
  def destroy
    @accept_condition.destroy
    respond_to do |format|
      format.html { redirect_to accept_conditions_url, notice: "Accept condition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accept_condition
      @accept_condition = AcceptCondition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accept_condition_params
      params.require(:accept_condition).permit(:user_id, :content, :importance)
    end
end
