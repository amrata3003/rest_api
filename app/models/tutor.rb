class Tutor < ApplicationRecord
  belongs_to :course, optional: true

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
