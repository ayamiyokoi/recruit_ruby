class Check < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :accept_condition, optional: true
  enum accept: { no_evidence: 0, yes: 1, no: 2 }
end
