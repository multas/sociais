# encoding: utf-8
class Multa < ActiveRecord::Base
  
  has_many :flags
  belongs_to :api_key
  
  scope :visible, where(:hidden => false)
  scope :invisible, where(:hidden => true)
  scope :tem_foto_ou_video, where("video <> '' or foto_file_name is not null")
  
	validates :descricao, :presence => true, :length => { :maximum => 2500, :too_long => "Máximo de caracteres permitidos: %{count}" }
	validates :placa, :length => { :maximum => 8, :too_long => "Máximo de caracteres permitidos: %{count}" }
	
	after_create  :send_notification_to_admin
  
  # Heroku: http://devcenter.heroku.com/articles/config-vars
  # export S3_KEY=mykey
  # export S3_SECRET=mysecret
  # heroku config:add S3_KEY=AAAAAAA S3_SECRET=BBBBBBBBBBBBBBBBBBBBB

  has_attached_file :foto,
    :storage => :s3,
    :bucket => 'msociais',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    }
    #:url => ":class/:attachment/:id/:style/:updated_at",
    #:hash_secret => "longSecretString"

  def tem_foto?
    !foto.size.nil?
  end
  
  def send_notification_to_admin
    # Tell the UserMailer to send an e-mail after save
    UserMailer.nova_multa_criada(self).deliver if SEND_EMAIL_TO_ADMIN
  end
  
  # Retorna a proxima multa, em ordem decrescente, com loop infinito (retornando a última caso chegue ao início)
  def next
    Multa.visible.tem_foto_ou_video.last(:conditions => ["id < ?", self.id], :order => "created_at ASC") || Multa.visible.tem_foto_ou_video.last(:order => "created_at ASC")
  end
  
  # Retorna a multa anterior, em ordem decrescente, com loop infinito (retornando a primeira caso chegue ao final)
  def previous
    Multa.visible.tem_foto_ou_video.first(:conditions => ["id > ?", self.id], :order => "created_at ASC") || Multa.visible.tem_foto_ou_video.first(:order => "created_at ASC")
  end
  
  # Retorna uma string dizendo se a multa está visível ou invisível
  def hidden_as_string
    if hidden
      "INVISÍVEL"
    else
      "visível"
    end
  end
  
  # Transforma todas as multas de um determinado IP em invisíveis e adiciona o IP na blacklist
  def bloquear_ip
    Multa.where(:creator_ip => self.creator_ip).update_all(:hidden => true)
    Blacklist.create(:ip => self.creator_ip, :enabled => true)
  end
  
  # Transforma uma multa em invisivel
  def hide
    hidden = true
  end
  
  # Transforma uma multa em visível
  def show
    hidden = false
  end
  
end
