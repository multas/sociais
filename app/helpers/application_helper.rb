module ApplicationHelper
  
  # Formata a exibiçao da data
  def format_timestamp timestamp
    timestamp.localtime.strftime("%d/%m/%Y %R")
  end
  
  # Links externos
  def external_link_to(body=nil, url)
    if body.nil?
      if url.length > 30
        body = "Site"
      else
        body = url
      end
    end 
    url = "http://#{url}" if url.index("http://").nil? && url.index("https://").nil? 
    link_to body, url, :target => "_blank"
  end
end
