class ItemsController < ApplicationController
inherit_resources
before_filter :authenticate_user!
respond_to :html, :xml
actions :index, :show, :new, :create, :edit, :update, :destroy

def index
  @items = Kaminari.paginate_array(current_user.items).page(params[:page]).per(20)
end

def create
  @item = Item.new(params[:item])
  @item.user_id = current_user.id
  respond_to do |format|
    if @item.save
      flash[:message] = 'To-do item added!'
      format.html { redirect_to(@item) }
      format.xml  { render :xml => @item, :status => :created, :location => @item }
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
    end
  end
end

end
