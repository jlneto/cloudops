class CcdeController < ApplicationController

  def show
    @app = App.find_by_name('ccde')
  end

  def execute
    @app = App.find_by_name('ccde')
    case params[:do]
      when 'update'
        @result = @app.update
      when 'setup'
        @result = @app.setup
      when 'status'
        @result = @app.status
    end
  end
end
