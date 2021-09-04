class DatasController < ApplicationController
  def index
    # 書類選考
    screening_process = Event.where(name: screening_process, user_id: current_user.id).count
    screening_process_passed = Event.where(name: screening_process, user_id: current_user.id, is_passed: 'passed').count
    if screening_process == 0
      @screening_process = 'データがありません'
    else
      @screening_process = 100*screening_process_passed/screening_process
    end

    # 一次選考
    first_interview = Event.where(name: first_interview, user_id: current_user.id).count
    first_interview_passed = Event.where(name: first_interview, user_id: current_user.id, is_passed: 'passed').count
    if first_interview == 0
      @first_interview = 'データがありません'
    else
      @first_interview = 100*first_interview_passed/first_interview
    end
  end
end
