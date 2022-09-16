class TransactionController < ApplicationController
  def index
    @transactions = Payment.all
  end

  def new
    @payment = Payment.new  
  end


  def create
    @transaction = Payment.new(transaction_params)    
    @transaction.user_id = 1
    #reference to category
    @transaction.category_ids = params[:payment][:category_id]
    if @transaction.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    transaction_item = Payment.find(params[:id])
    transaction_item.destroy
    redirect_to category_path(params[:id])
  end
  private

  def transaction_params
    params.require(:payment).permit(:name, :amount)
  end


end
