class QuotesController < ApplicationController

  before_action :set_quote, only: [:edit, :update, :show, :destroy]

  def index
    @quotes = Quote.order(id: "desc")
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    unless @quote.save
      render :new, status: :unprocessable_entity
    end
  end

  def show
    
  end
  
  def edit
  end
  
  def update
    unless @quote.update(quote_params)
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @quote.destroy
  end

  private

  def quote_params
    params.require(:quote).permit(:name)
  end
  

  def set_quote
    @quote = Quote.find(params[:id])
  end
  

end
