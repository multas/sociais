# encoding: utf-8
class UserMailer < ActionMailer::Base
  
  helper :Application
  
  default :from => "Multas Sociais <contato@multassociais.net>", :charset => "UTF-8"
  ADMIN_EMAIL = "admin@multassociais.net"
  DEFAULT_SUBJECT = "[Multas Sociais] "
  
  def new_multa(multa)
    @multa = multa
    @root_url = "http://www.multassociais.net"
    mail(:to => ADMIN_EMAIL, :subject => DEFAULT_SUBJECT + "Nova multa cadastrada")
  end
  
  def new_api_key(api_key)
    @api_id = api_key.api_id
    @api_secret = api_key.api_secret
    admin_email = (SEND_EMAIL_TO_ADMIN ? ADMIN_EMAIL : "")
    mail(:to => api_key.owner_email, :bcc => admin_email, :subject => DEFAULT_SUBJECT + "Sua Chave de Acesso à API foi gerada")
  end
end
