class AcceptCondition < ApplicationRecord
  belongs_to :user
  has_many :checks
  enum importance: { low: 0, medium: 1, high: 2 }
end
