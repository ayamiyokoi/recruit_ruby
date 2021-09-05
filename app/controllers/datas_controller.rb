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
    # processes = Event.where(user_id: current_user.id)

    # processes.each do |process|
    #   mother_0 = 0
    #   child_0 = 0
    #   if process.name == "screening_process" && process.is_passed == "passed"
    #     mother_0 += 1
    #     child_0  += 1
    #   elsif process.name == "screening_process"
    #     mother_0 += 1
    #   end
    #     @screening_process = 100*child_0/mother_0


    # end

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

     # 4次選考
    fourth_interview = Event.where(name: 5, user_id: current_user.id).count
    fourth_interview_passed = Event.where(name: 5, user_id: current_user.id, is_passed: 1).count
    if fourth_interview == 0
      @fourth_interview = 'データがありません'
    else
      @fourth_interview = 100*fourth_interview_passed/fourth_interview
    end

     # 5次選考
    fifth_interview = Event.where(name: 6, user_id: current_user.id).count
    fifth_interview_passed = Event.where(name: 6, user_id: current_user.id, is_passed: 1).count
    if fifth_interview == 0
      @fifth_interview = 'データがありません'
    else
      @fifth_interview = 100*fifth_interview_passed/fifth_interview
    end

     #最終選考
    last_interview = Event.where(name: 7, user_id: current_user.id).count
    last_interview_passed = Event.where(name: 7, user_id: current_user.id, is_passed: 1).count
    if last_interview == 0
      @last_interview = 'データがありません'
    else
      @last_interview = 100*last_interview_passed/last_interview
    end
  end
end
