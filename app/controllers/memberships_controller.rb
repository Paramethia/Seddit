class MembershipsController < ApplicationController
    before_action :authenticate_user!, only: %i[ create destroy ]
    before_action :set_subseddit
  
    def create
      #subseddit = Subseddit.find(params[:id])
      #membership = subseddit.memberships.build(user: current_user)
      membership = current_user.memberships.new(subseddit: @subseddit)
  
      if membership.save
        @subseddit.increment!(:people)
        redirect_to subseddit_path(@subseddit)
      else
        redirect_to subseddit_path(@subseddit)
      end
    end
  
    def destroy
      #subseddit = Subseddit.find(params[:subseddit_id])
      #membership = subseddit.memberships.find_by(user: current_user)
      membership = current_user.memberships.find_by(subseddit: @subseddit)
  
      if membership
        membership.destroy
        @subseddit.decrement!(:people)
        redirect_to subseddit_path(@subseddit), notice: "You have left #{@subseddit.name}."
      else
        redirect_to subseddit_path(@subseddit), alert: "You are not a member of this subseddit."
      end
    end

    def set_subseddit
        @subseddit = Subseddit.find_by(name: params[:subseddit_id])
    end
  end
  