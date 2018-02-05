class Book < ApplicationRecord
  scope :finished, -> { where('finished_at is not null') }
  validates :title, presence: true
end
