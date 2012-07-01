class ApplicationController < ActionController::Base
  
  require 'constants'
  
  protect_from_forgery
  
  before_filter :prepare_multa
  around_filter :check_blacklist
  
  def prepare_multa
    @multa = Multa.new
  end
  
  # Ignora solicitações vindas de IP que estão na blacklist
  def check_blacklist
    if Blacklist.where(:ip => request.remote_ip, :enabled => true).blank?
      yield
    else
      logger.warn "IP Blacklisted: #{request.remote_ip}"
      render :text => "We're sorry, but we have to deny your request for security purposes!"
    end 
  end
  
end
