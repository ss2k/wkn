class EditorshipsController < ApplicationController
  def create
    hotspot = find_hotspot
    user = find_user
    if user
      if hotspot.users.include? user
        flash[:error] = 'User is already an editor'
      else
        hotspot.editorships.create :user_id => user.id
        flash[:notice] = 'Success!'
      end
    else
      flash[:error] = 'No account with this email found'
    end
    redirect_to hotspot_editorships_path(hotspot)
  end

  def destroy
    hotspot = find_hotspot
    editorship = hotspot.editorships.find(params[:id])
    editorship.destroy
    if current_user == editorship.user
      redirect_to root_path
    else
      redirect_to hotspot_editorships_path(hotspot)
    end
  end

  def index
    @hotspot = current_user.hotspots.find(params[:hotspot_id])
    @editorship = find_hotspot.editorships.build
  end

  private

  def find_user
    User.where(['? = email', params[:editorship][:users][:email]]).first
  end

  def find_hotspot
    current_user.hotspots.find params[:hotspot_id]
  end
end

