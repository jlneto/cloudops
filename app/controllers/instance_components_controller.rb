class InstanceComponentsController < ApplicationController
  before_action :set_instance_component, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @instance_components = InstanceComponent.all
    respond_with(@instance_components)
  end

  def show
    respond_with(@instance_component)
  end

  def new
    @instance_component = InstanceComponent.new
    respond_with(@instance_component)
  end

  def edit
  end

  def create
    @instance_component = InstanceComponent.new(instance_component_params)
    @instance_component.save
    respond_with(@instance_component)
  end

  def update
    @instance_component.update(instance_component_params)
    respond_with(@instance_component)
  end

  def destroy
    @instance_component.destroy
    respond_with(@instance_component)
  end

  private
    def set_instance_component
      @instance_component = InstanceComponent.find(params[:id])
    end

    def instance_component_params
      params.require(:instance_component).permit(:instance_id, :app_component_id, :name, :template, :arn, :address)
    end
end
