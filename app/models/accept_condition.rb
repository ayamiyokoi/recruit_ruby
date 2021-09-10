class AcceptCondition < ApplicationRecord
  belongs_to :user
  has_many :checks, dependent: :destroy
  enum importance: { low: 0, medium: 1, high: 2 }
  validates :content, {presence: true}
  validates :importance, {presence: true}
end
