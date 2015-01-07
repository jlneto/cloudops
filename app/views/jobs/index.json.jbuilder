json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :command, :output, :user_id, :instance_component_id, :success, :started_at, :finished_at, :delayed_job_id
  json.url job_url(job, format: :json)
end
