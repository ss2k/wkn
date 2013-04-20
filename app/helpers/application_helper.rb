module ApplicationHelper
  def viewable_flash
    flash.to_hash.slice(:notice, :alert)
  end
end

