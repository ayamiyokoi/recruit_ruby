class Company < ApplicationRecord
  belongs_to :user
  enum media: { unselected: 0, mynavi: 1, recnavi: 2, type: 3, doda: 4, green: 5, wantedly: 6, type: 7, dmm: 8, other: 9 }
end
