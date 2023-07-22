class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if current_user&.owner_mode
      redirect_to revenue_path
    end
    @properties = Property.order(rating: :desc).limit(5)
  end

  def revenue
    if current_user && !current_user.owner_mode
      redirect_to root_path
    end
  end
end
