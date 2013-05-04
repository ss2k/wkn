class EditorshipsController < ApplicationController
  def create
    @hotspot = current_user.hotspots.find params[:hotspot_id]
    user = find_user
    if user
      if @hotspot.users.include? user
        flash[:error] = 'User is already an editor'
      else
        @hotspot.editorships.create :user_id => user.id
        flash[:notice] = 'Success!'
      end
    else
      flash[:error] = 'No account with this email found'
    end
    redirect_to @hotspot
  end

  private

  def find_user
    User.where(['? = email', params[:editorship][:user_email]]).first
  end
end

