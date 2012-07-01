module MultasHelper

  # Valida se uma URL é do Youtube
  def isYoutube url
      url.split("youtube.com/watch").size > 1
  end
  
  # Valida se uma string contem outra
  def contains(str1, str2)
    str1.split(str2).size > 1
  end
  
  # Monta o texto de previsualizacao com um máximo de caracteres predefinido
  def preview text
    if text.length > PREVIEW_MAX_LENGTH
      text[0, PREVIEW_MAX_LENGTH] + "..."
    else
      text
    end
  end
  
  # Exibe informações do aplicativo utilizado
  def app_info(multa)
    "<span class='app-info'>via #{external_link_to multa.api_key.app_name[0..25], multa.api_key.app_site}</span>".html_safe unless multa.api_key.blank? || multa.api_key.app_name.blank? || multa.api_key.app_site.blank?  
  end
end
