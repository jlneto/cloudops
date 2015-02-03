class Command
  ROOT_DIR = './workdir/apps'
  @cmd_stack

  def initialize( app )
    if app.present?
      @home = "#{app}"
      @full_path = "#{ROOT_DIR}/#{home}"
      %x(mkdir #{@full_path}; cd #{@full_path})
      @cmd_stack = ["cd #{@full_path}"]
    else
      raise 'App must be informed!'
    end
  end

  def add(cmd_str)
    @cmd_stack << cmd_str
  end

  def list
    @cmd_stack.join("\n")
  end

  def run
    %x(self.list)
  end
end