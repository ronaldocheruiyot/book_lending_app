class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @borrowings = current_user.borrowings.includes(:book)
  end
end
