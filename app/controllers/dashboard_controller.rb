class DashboardController < ApplicationController
before_filter :authenticate_user!
respond_to :html, :xml, :json

def index
  @items = Kaminari.paginate_array(current_user.items.all(:conditions=>["status!=? and status!=?",'Completed','Cancelled'])).page(params[:page]).per(20)
end

end
