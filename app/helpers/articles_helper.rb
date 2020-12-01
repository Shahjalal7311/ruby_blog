module ArticlesHelper
  def strip_html_tags(string)
    ActionView::Base.full_sanitizer.sanitize(string)
  end

  def Noimage(img)
    if (img == 'NULL')
      return 'public/images/avatar.png' 
    else 
      return img
    end   
  end

end
