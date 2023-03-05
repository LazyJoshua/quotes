class LineItemDate < ApplicationRecord
  belongs_to :quote
  validates_presence_of :date
  validates_uniqueness_of :date, scope: :quote_id
end
