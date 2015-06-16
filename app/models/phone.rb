class Phone < ActiveRecord::Base
  belongs_to :user
  validates :phone_number, presence: true
  validates :user, presence: true
end
