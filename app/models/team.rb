class Team < ActiveRecord::Base
  has_and_belongs_to_many :match
  has_many :memberships
  has_many :users, through: :memberships
  validates_presence_of :team_name
  accepts_nested_attributes_for :memberships
end
