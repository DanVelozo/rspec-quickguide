class LinksController < ApplicationController
  def new
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      flash[:notice] = 'Your link has been shortened!'
      redirect_to link_path(@link)
    else
      render :new
    end
  end

  def show
  end
end
