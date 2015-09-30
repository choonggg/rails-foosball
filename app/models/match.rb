class Match < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :games

  accepts_nested_attributes_for :teams
end
