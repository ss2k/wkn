module ApplicationHelper
  def viewable_flash
    flash.to_hash.slice(:notice, :alert, :error)
  end

  def full_title page_title = ''
    base_title = 'WiFi-K9'
    page_title.empty? ? base_title : "#{base_title} :: #{page_title}"
  end
end

