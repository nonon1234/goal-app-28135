class Goal < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title, :description, :deadline
  end
end
