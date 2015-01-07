class InstanceComponent < ActiveRecord::Base
  belongs_to :instance
  belongs_to :app_component
end
