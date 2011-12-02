class WantsController < ApplicationController
  def create
    workshop = Workshop.find(params[:workshop_id])
    lead = workshop.add_new_want(params[:email])
    if lead.valid?
      render :text => "Thanks"
    else
      render :text => lead.errors.full_messages.join(" ")
    end
  end
end


