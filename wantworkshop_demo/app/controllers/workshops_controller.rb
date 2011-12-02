class WorkshopsController < ApplicationController
  def show
    @workshop = Workshop.find(params[:id])
  end
end
