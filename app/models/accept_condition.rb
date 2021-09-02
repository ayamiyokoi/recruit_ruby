class AcceptCondition < ApplicationRecord
  belongs_to :user
  enum importance: { low: 0, medium: 1, high: 2 }
end
