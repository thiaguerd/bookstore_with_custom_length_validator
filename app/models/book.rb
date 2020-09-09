class Book < ApplicationRecord
  belongs_to :author
  validates :isbn, length: { included: [10, 13] }
end
