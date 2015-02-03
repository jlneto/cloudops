class CcdeController < ApplicationController

  def show

  end

  def setup
    # crio o diretorio de trabaglo do app
    # tenho que copiar os fontes para um diretorio de trabalho
    ccde = App.find_by_name('ccde')
    result = ccde.setup
    flash[:notice] = result
    redirect_to action: :status
  end

  def status
    @app = App.find_by_name('ccde')
    if @app.ok?
      @status = @app.status
    end
  end

  def update
    # vai para o diretorio de trabalho desse app
    # git checkout no branch do ambiente
    # git pull
    # app_pack.sh rails_env role
    # app_deploy.sh rails_env role
  end
end
