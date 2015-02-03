class Instance < ActiveRecord::Base
  belongs_to :app

  def setup
    cmd = Cmd.new

  end
end
