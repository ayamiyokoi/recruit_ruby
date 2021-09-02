class Event < ApplicationRecord
  belongs_to :user
  belongs_to :company

  enum name: { introduction: 0, first_interview: 1, second_interview: 2, third_interview: 3, fourth_interview: 4, fifth_interview: 5, last_interview: 6, talk: 7, other: 8 }
  enum is_passed: { no_result: 0, passed: 1, droped: 2 }
end
