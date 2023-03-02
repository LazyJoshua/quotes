class Quote < ApplicationRecord

  validates_presence_of :name

  after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", 
    locals: { quote: self }, target: "quotes" }

end
