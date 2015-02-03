class CcdeController < ApplicationController

  def show

  end

  def setup
    # crio o diretorio de trabaglo do app
    # tenho que copiar os fontes para um diretorio de trabalho
    ccde = App.find_by_name('ccde')
    result = ccde.setup
    flash[:notice] = result
    redirect_to ccde_status_path
  end

  def status
    @app = App.find_by_name('ccde')
    if @app.ok?
      @status = @app.status
    end
  end

  def update
    @app.update
  end
end
