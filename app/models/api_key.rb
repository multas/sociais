class ApiKey < ActiveRecord::Base
  has_many :multas
  
  after_create  :send_api_id_and_secret_to_user_and_notify_admins
  
  # Envia id e senha para o usuário e avisa aos admins que uma nova ApiKey foi cadastrada
  def send_api_id_and_secret_to_user_and_notify_admins
    UserMailer.new_api_key(self).deliver
  end
end
