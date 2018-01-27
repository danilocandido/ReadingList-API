class Book < ApplicationRecord
  scope :finished, -> { where('finished_at is not null') }
end
