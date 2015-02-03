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
    cmd = Command.new(self.name)
    cmd.add "mkdir #{self.full_path}; cd #{self.full_path}"
    cmd.add "rvm use ruby-#{self.ruby_version}@#{self.to_s} --ruby-version --create"
    cmd.add "git clone #{self.github_url}"
    cmd.run
    cmd
  end

  def status(env = 'production')
    cmd = Command.new(self.name)
    cmd.add "./app_list_all_instances_status.sh #{env}"
    cmd.run
    cmd
  end



end
