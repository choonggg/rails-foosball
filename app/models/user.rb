class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  def display_name
    [first_name, last_name].compact.join(" ")
  end
end
