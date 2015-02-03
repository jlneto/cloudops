class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @apps = App.all
    respond_with(@apps)
  end

  def show
    respond_with(@app)
  end

  def new
    @app = App.new
    respond_with(@app)
  end

  def edit
  end

  def create
    @app = App.new(app_params)
    @app.save
    respond_with(@app)
  end

  def update
    @app.update(app_params)
    respond_with(@app)
  end

  def destroy
    @app.destroy
    respond_with(@app)
  end

  private
    def set_app
      @app = App.find(params[:id])
    end

    def app_params
      params.require(:app).permit(:name, :description, :template, :github_url)
    end
end
