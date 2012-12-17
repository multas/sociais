class ApiController < ApplicationController

  # You can disable csrf protection on controller-by-controller basis
  skip_before_filter :verify_authenticity_token
  
  # Let's check API Key code
  before_filter :verify_api_secret, :only => [:create]

  # GET /api/new
  def new
    @api = Multa.new
    render :layout => false
  end
  
  # POST /api
  def create
    @multa = Multa.new(params[:multa])
    @multa.creator_ip = request.remote_ip 
    @multa.api_key_id = ApiKey.find_by_api_id(params[:api_id]).id
    
    if @multa.save
      render :nothing => true
    else
      logger.error @multa.errors.to_yaml
      render :file => "public/500.html", :status => 500, :layout => false
    end
  end

  # GET /aplicativos
  def aplicativos
    # Página estática - Não precisa de ação no controller
  end

  private
  
  def verify_api_secret
    api_id = params[:api_id]
    api_secret = params[:api_secret]
    render :file => "public/422.html", :status => :unauthorized, :layout => false if ApiKey.find_by_api_id_and_api_secret(api_id, api_secret).nil?
  end
    
end
