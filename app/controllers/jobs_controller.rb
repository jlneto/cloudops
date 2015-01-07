class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :run]

  respond_to :html

  def index
    @jobs = Job.all
    respond_with(@jobs)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.save
    respond_with(@job)
  end

  def update
    @job.update(job_params)
    respond_with(@job)
  end

  def destroy
    @job.destroy
    respond_with(@job)
  end

  def run
    @job.reset
    Job.delay.run(@job.id)
    redirect_to action: 'show'
  end

  def execute
    job = Job.new
    job.command = params[:cmd]
    job.save
    Job.delay.run(job.id)
    render plain: job.id
  end

  def job_output
    render plain: Job.output(params[:id])
  end

  def job_finished
    render plain: Job.finished?(params[:id])
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :command, :output, :user_id, :instance_component_id, :success, :started_at, :finished_at, :delayed_job_id)
    end
end
