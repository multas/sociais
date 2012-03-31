# encoding: utf-8
class MultasController < ApplicationController
  
  # Autenticação básica, só pra começar
  http_basic_authenticate_with :name => ENV['AUTH_USER'], :password => ENV['AUTH_PASS'], :only => [:edit, :update, :destroy, :invisiveis]
  
  # GET /multas
  def index
    offset = params[:p].to_i || 0 
    @multas = Multa.visible.tem_foto_ou_video.find(:all, :order => "created_at DESC", :limit => MULTAS_POR_REQUEST, :offset => offset)
    @mais_novos_css_class = "atual"
    @mais_multados_css_class = ""
    @offset = Multa.visible.tem_foto_ou_video.size > offset + MULTAS_POR_REQUEST ? offset + MULTAS_POR_REQUEST : nil
  end

  # GET /mais_multados
  def mais_multados
    offset = params[:p].to_i || 0 
    @multas = Multa.visible.tem_foto_ou_video.find(:all, :order => "likes DESC", :limit => MULTAS_POR_REQUEST, :offset => offset)
    @mais_novos_css_class = ""
    @mais_multados_css_class = "atual"
    render :index
  end

  # GET /multas/1
  # GET /multas/1.json
  def show
    @multa_show = Multa.visible.find(params[:id])
    @next = @multa_show.next
    @previous = @multa_show.previous
    @description = @multa_show.descricao
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @multa_show }
    end
  end

  # GET /multas/new
  # GET /multas/new.json
  def new
    @multa = Multa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @multa }
    end
  end

  # GET /multas/1/edit
  def edit
    @multa = Multa.find(params[:id])
  end

  # POST /multas
  # POST /multas.json
  def create
    @multa = Multa.new(params[:multa])
    @multa.creator_ip = request.remote_ip 
    
    respond_to do |format|
      if @multa.save
        # Tell the UserMailer to send an e-mail after save
        UserMailer.nova_multa_criada(@multa).deliver
        
        format.html { redirect_to @multa, notice: 'Multa registrada com sucesso.' }
        format.json { render json: @multa, status: :created, location: @multa }
      else
        format.html { render action: "new" }
        format.json { render json: @multa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /multas/1
  # PUT /multas/1.json
  def update
    @multa = Multa.find(params[:id])

    respond_to do |format|
      if @multa.update_attributes(params[:multa])
        format.html { redirect_to @multa, notice: 'Multa atualizada com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @multa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multas/1
  def destroy
    multa = Multa.find(params[:id])
    multa.update_attributes(:hidden => true)

    redirect_to lista_admin_index_url
  end

  # GET /multas/1/flag
  def flag
    @multa_show = Multa.find(params[:multa_id])
  end
  
  # POST /multas/1/create_flag
  def create_flag
    multa = Multa.find(params[:multa_id])
    flag = Flag.new(params[:flag])
    flag.multa = multa
    flag.save
    
    message = "Seu pedido de remoção foi recebido. A multa será retirada em instantes."
    
    # Remove automaticamente a multa caso atinja o limite máximo de flags
    if multa.flags.size > MAX_FLAGS
      multa.update_attributes(:hidden => true)
      message = "Seu pedido de remoção foi recebido. A multa foi temporariamente removida e será avaliada."
    end
     
    redirect_to multas_url, notice: message
  end
  
  # POST /multas/1/like
  def like
    multa = Multa.find(params[:multa_id])
    multa.update_attributes(:likes => multa.likes + 1)
    render :nothing => true
  end
  
  # GET /sobre
  def sobre
    # Página estática - Não precisa de ação no controller
  end
  
end
