class Book < ApplicationRecord
  has_many :borrowings
  validates :title, :author, :isbn, presence: true
  validates :isbn, uniqueness: true

  def available?
    borrowings.where(returned_at: nil).empty?
  end
end
