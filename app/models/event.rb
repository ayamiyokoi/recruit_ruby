class Event < ApplicationRecord
  belongs_to :user
  belongs_to :company

  enum name: { introduction: 0, screening_process: 1, first_interview: 2, second_interview: 3, third_interview: 4, last_interview: 5, talk: 6, other: 7}
  enum is_passed: { no_result: 0, passed: 1, droped: 2 }
  validates :name, {presence: true}
  validates :company_id, {presence: true}
  validates :date, {presence: true}
  validates :is_passed, {presence: true}
end
