module ArticlesHelper
  def strip_html_tags(string)
    ActionView::Base.full_sanitizer.sanitize(string)
  end

  def checkImages(img)
    data = img.attachment
    if(data.nil? || data.to_s.empty?)
      display_img ='/images/photo1.png'
    else
      display_img = data
    end   
  end

end
