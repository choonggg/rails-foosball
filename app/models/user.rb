class User < ActiveRecord::Base

  def display_name
    [first_name, last_name].compact.join(" ")
  end
end
