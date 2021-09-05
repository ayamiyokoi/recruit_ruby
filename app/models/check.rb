class Check < ApplicationRecord
  belongs_to :company
  belongs_to :accept_condition
  enum accept: { no_evidence: 0, yes: 1, no: 2 }
  
end
