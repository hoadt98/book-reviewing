class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  belongs_to :publishhouse
  scope :book_order, ->{order created_at: :desc}

  delegate :author_name, to: :author
  delegate :publishhouse_name, to: :publishhouse
end
