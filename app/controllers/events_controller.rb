class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  PER_PAGE = 10
  # GET /events or /events.json
  def index
    @events_past = Event.where("date <= ?", Date.today).where(user_id: current_user.id).order(date: "DESC").page(params[:page]).per(PER_PAGE)
    @events = Event.where("date > ?", Date.today).where(user_id: current_user.id).order(date: "ASC").page(params[:page]).per(PER_PAGE)

  end

  # GET /events/1 or /events/1.json
  def show
    if @event.user == current_user
      render "show"
    else
      redirect_to root_path
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    if @event.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    respond_to do |format|
      if @event.save
        # イベントのステータスで落選に変更されたら、企業のステータスを選考済みに変更
        if @event.is_passed == 'droped'
          company = Company.find(@event.company_id)
          company.is_active = false
          company.save
        end
        format.html { redirect_to @event, notice: "イベントの作成に成功しました。" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
         # イベントのステータスで落選に変更されたら、企業のステータスを選考済みに変更
        if @event.is_passed == 'droped'
          company = Company.find(@event.company_id)
          company.is_active = false
          company.save
        end
        format.html { redirect_to @event, notice: "イベントの更新に成功しました。" }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "イベントの削除に成功しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:user_id, :company_id, :name, :date, :is_passed)
    end
end
