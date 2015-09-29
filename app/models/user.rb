class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  has_many :memberships
  has_many :teams, through: :memberships

  def display_name
    [first_name, last_name].compact.join(" ")
  end
end
