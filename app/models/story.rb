class Story < ActiveRecord::Base
  #belongs_to :user
  belongs_to :project
  #belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  #belongs_to :requested_by, :class_name => "User", :foreign_key => "requester_id"
  has_many :labels, :through => "story_labels"
  belongs_to :project
  validates_presence_of :title, :requester_id, :story_type
end
