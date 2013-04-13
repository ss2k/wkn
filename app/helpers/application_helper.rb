module ApplicationHelper
  def viewable_flash
    flash.to_hash.slice(:notice, :alert)
  end

  def devise_or_root?
    devise_controller? || current_page?(root_path)
  end
end

