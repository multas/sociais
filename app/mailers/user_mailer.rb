class UserMailer < ActionMailer::Base
  
  helper :Application
  
  default :from => "Multas Sociais <contato@multassociais.net>", :charset => "UTF-8"
  ADMIN_EMAIL = "admin@multassociais.net"
  
  def nova_multa_criada(multa)
    @multa = multa
    @root_url = "http://www.multassociais.net"
    mail(:to => ADMIN_EMAIL, :subject => "[Multas Sociais] Nova multa cadastrada")
  end
end
