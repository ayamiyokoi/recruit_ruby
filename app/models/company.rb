class Company < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :checks, dependent: :destroy
  enum media: { unselected: 0, mynavi: 1, recnavi: 2, type: 3, doda: 4, green: 5, wantedly: 6, dmm: 7, other: 8 }
  validates :name, {presence: true}
end
