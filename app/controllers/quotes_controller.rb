class QuotesController < ApplicationController

  before_action :set_quote, only: [:edit, :update, :show, :destroy]

  def index
    @quotes = current_company.quotes.order(id: "desc")
  end

  def new
    @quote = current_company.quotes.new
  end

  def create
    @quote = current_company.quotes.new(quote_params)
    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @line_item_dates = @quote.line_item_dates.order(date: "asc")
  end
  
  def edit
  end
  
  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:name)
  end
  

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end
  

end
