# encoding: utf-8
class AdminController < ApplicationController

  # Autenticação básica, só pra começar - Para todos os métodos deste controller
  http_basic_authenticate_with :name => ENV['AUTH_USER'], :password => ENV['AUTH_PASS']
  
  # GET /admin
  def index
    
  end
    
  # GET /admin/invisiveis
  def invisiveis
    offset = params[:p].to_i || 0 
    @multas = Multa.invisible.find(:all, :order => "created_at DESC", :limit => MULTAS_POR_REQUEST, :offset => offset)
    @mais_novos_css_class = @mais_multados_css_class = ""
    render "multas/index", notice: "Multas invisíveis"
  end
  
  # GET /admin/lista
  def lista
    @multas = Multa.find(:all, :order => "created_at DESC")
    render :layout => 'simple'
  end
  
  # DELETE /admin/bloquear_ip/:multa_id
  def bloquear_ip
    Multa.find(params[:id]).bloquear_ip
    redirect_to lista_admin_index_path
  end
  
  # GET /admin/blacklist
  def blacklist
    @blacklist = Blacklist.enabled
  end
  
  # PUT /admin/remover_blacklist/:blacklist_id
  def remover_blacklist
    Blacklist.find(params[:id]).update_attributes(:enabled => false)
    redirect_to blacklist_admin_index_path
  end
  
  # Mostra multa, mesmo as invisíveis
  # GET /admin/show_multa/:multa_id
  def show_multa
    @multa_show = Multa.find(params[:multa_id])
    @next = @multa_show.next
    @previous = @multa_show.previous
    @description = @multa_show.descricao
    render 'multas/show'
  end

end
