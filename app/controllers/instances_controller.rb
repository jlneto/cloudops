class InstancesController < ApplicationController
  before_action :set_instance, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @instances = Instance.all
    respond_with(@instances)
  end

  def show
    respond_with(@instance)
  end

  def new
    @instance = Instance.new
    respond_with(@instance)
  end

  def edit
  end

  def create
    @instance = Instance.new(instance_params)
    @instance.save
    respond_with(@instance)
  end

  def update
    @instance.update(instance_params)
    respond_with(@instance)
  end

  def destroy
    @instance.destroy
    respond_with(@instance)
  end

  private
    def set_instance
      @instance = Instance.find(params[:id])
    end

    def instance_params
      params.require(:instance).permit(:app_id, :name, :description, :parameters, :tags)
    end
end
