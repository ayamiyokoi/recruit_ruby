class DatasController < ApplicationController
  def index
    # 書類選考
    screening_process = Event.where(name: 1, user_id: current_user.id).count
    screening_process_passed = Event.where(name: 1, user_id: current_user.id, is_passed: 1).count
    if screening_process == 0
      @screening_process = 'データがありません'
    else
      @screening_process = 100*screening_process_passed/screening_process
    end


    # 1次選考
    first_interview = Event.where(name: 2, user_id: current_user.id).count
    first_interview_passed = Event.where(name: 2, user_id: current_user.id, is_passed: 1).count
    if first_interview == 0
      @first_interview = 'データがありません'
    else
      @first_interview = 100*first_interview_passed/first_interview
    end

     # 2次選考
    second_interview = Event.where(name: 3, user_id: current_user.id).count
    second_interview_passed = Event.where(name: 3, user_id: current_user.id, is_passed: 1).count
    if second_interview == 0
      @second_interview = 'データがありません'
    else
      @second_interview = 100*second_interview_passed/second_interview
    end

     # 3次選考
    third_interview = Event.where(name: 4, user_id: current_user.id).count
    third_interview_passed = Event.where(name: 4, user_id: current_user.id, is_passed: 1).count
    if third_interview == 0
      @third_interview = 'データがありません'
    else
      @third_interview = 100*third_interview_passed/third_interview
    end

     #最終選考
    last_interview = Event.where(name: 5, user_id: current_user.id).count
    last_interview_passed = Event.where(name: 5, user_id: current_user.id, is_passed: 1).count
    if last_interview == 0
      @last_interview = 'データがありません'
    else
      @last_interview = 100*last_interview_passed/last_interview
    end
  end
end
