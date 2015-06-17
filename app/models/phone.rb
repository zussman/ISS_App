class Phone < ActiveRecord::Base
  belongs_to :user
  validates :phone_number, presence: true
end
