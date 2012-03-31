module ApplicationHelper
  
  # Formata a exibiçao da data
  def format_timestamp timestamp
    timestamp.localtime.strftime("%d/%m/%Y %R")
  end
end
