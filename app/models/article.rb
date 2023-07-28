class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author
  scope :published, -> {where(publish_time: (DateTime.now)..)}
end
