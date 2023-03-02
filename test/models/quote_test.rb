require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create quote" do
    quote = Quote.new
    assert_not quote.valid?
    assert_not quote.save
    quote.name = "first quote"
    assert quote.valid?
    assert quote.save
  end
end
