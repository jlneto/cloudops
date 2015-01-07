class AppComponentsController < ApplicationController
  before_action :set_app_component, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @app_components = AppComponent.all
    respond_with(@app_components)
  end

  def show
    respond_with(@app_component)
  end

  def new
    @app_component = AppComponent.new
    respond_with(@app_component)
  end

  def edit
  end

  def create
    @app_component = AppComponent.new(app_component_params)
    @app_component.save
    respond_with(@app_component)
  end

  def update
    @app_component.update(app_component_params)
    respond_with(@app_component)
  end

  def destroy
    @app_component.destroy
    respond_with(@app_component)
  end

  private
    def set_app_component
      @app_component = AppComponent.find(params[:id])
    end

    def app_component_params
      params.require(:app_component).permit(:app_id, :name, :description, :type, :template, :instructions)
    end
end
