class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :instance_component
end
