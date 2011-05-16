class GamenightsController < ApplicationController

  def index
    @gamenights = Gamenight.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @gamenight }
    end
  end

  def show
    @gamenight = Gamenight.find(params[:id])

        respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gamenight }
    end
  end

  def new
    @gamenight = current_user.gamenights.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gamenight }
    end
  end

  def create
    @gamenight = current_user.gamenights.build(params[:gamenight])
    @gamenight.user = current_user
    if @gamenight.save
      flash[:success] = "New gamenight created"
      redirect_to :my_gamenights
    else
      render 'gamenights/new'
    end
  end

  def destroy
    Gamenight.find(params[:id]).destroy
    flash[:success] = "Gamenight deleted."
    redirect_to :my_gamenights
  end
end
