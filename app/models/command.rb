class Command
  ROOT_DIR = './workdir/apps'
  @cmd_stack

  def initialize( app, go_home = true )
    if app.present?
      @cmd_stack = []
      @cmd_stack << "cd #{app.full_path}" if go_home
    else
      raise 'App must be informed!'
    end
  end

  def add(cmd_str)
    @cmd_stack << cmd_str
  end

  def list
    @cmd_stack.join("; ")
  end

  def run
    cmd = "#{self.list} 2>&1"
    puts 'About to run:'
    puts cmd
    response = %x[#{cmd}]
    response
  end
end