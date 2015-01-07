class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :instance_component

  def run
    cmd = self.command
    self.output = ''
    self.started_at = Time.now
    self.finished_at = nil
    self.save
    IO.popen(cmd) do | cmd_io |
      until cmd_io.eof?
        out_line = cmd_io.readline
        self.output += out_line
        self.save
      end
    end
    self.success = $?.success?
    self.finished_at = Time.now
    self.save
    self.success
  end

  def self.run(job_id)
    job = Job.find(job_id)
    job.run
  end

  def self.shell(command)
    job = Job.new
    job.command = command
    job.save
    job.run
    job.success
  end

  def self.output(job_id)
    Job.find(job_id).output rescue nil
  end

  def self.finished?(job_id)
    Job.find(job_id).finished_at.present?
  end

  def reset
    self.finished_at = nil
    self.output = nil
    self.save
  end

end
