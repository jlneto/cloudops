class App < ActiveRecord::Base
  has_many :app_components

  def to_s
    self.name
  end

  def home
    "#{self.name.downcase}"
  end

  def ruby_version
    '2.1.2'
  end

  def ok?
    File.directory?(self.full_path)
  end

  def full_path
    "#{Rails.root}/workarea/apps/#{self.home}"
  end

  def setup
    cmd = Command.new(self, false)
    cmd.add "mkdir -p #{self.full_path}"
    cmd.add "cd #{self.full_path}"
    cmd.add "rvm use ruby-#{self.ruby_version}@#{self.to_s.downcase} --ruby-version --create"
    cmd.add "git clone #{self.github_url} ."
    cmd.run
    cmd
  end

  def status(env = 'staging')
    cmd = Command.new(self)
    cmd.add "./app_list_all_instances_status.sh #{env}"
    cmd.run
  end

  def update(env = 'staging')
    # cmd = Command.new(self)
    # cmd.add "./app_pack.sh #{env}"
    # cmd.add "./app_deploy.sh #{env}"
    # cmd.run
  end


end
