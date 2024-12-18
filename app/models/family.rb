class Family < ApplicationRecord
  has_many :users, dependent: :nullify

  validates :family_name, presence: true, uniqueness: { case_sensitive: false }
end
