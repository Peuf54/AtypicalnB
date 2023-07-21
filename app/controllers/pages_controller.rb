class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if current_user&.owner_mode
      current_user.owner_mode = false
      current_user.save
      redirect_to root_path
    end
    @properties = Property.order(rating: :desc).limit(5)
  end
end
