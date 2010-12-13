class Project < ActiveRecord::Base
  #has_many :members, :through => "project_users", :foreign_key => "user_id"
  has_many :stories

  attr_accessible :time_zone

  validates_presence_of :name, :start_date
end
