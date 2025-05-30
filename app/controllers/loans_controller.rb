class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show update destroy ]

  # GET /loans
  def index
    @loans = Loan.all

    render json: @loans
  end

  # GET /loans/1
  def show
    render json: @loan
  end

  # POST /loans
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      render json: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.expect(loan: [ :user_id, :book_id, :loan_date, :return_date, :returned ])
    end
end
