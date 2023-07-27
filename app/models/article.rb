class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author
end
