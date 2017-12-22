class PagesController < ApplicationController
  def index
  end

  def save
    data = params[:value]
    are_you_sick = SaveWordsService.new.are_you_sick?(data)
    unless  are_you_sick.nil?
      render :json => { :success => true, :sickness => are_you_sick }
    end
  end
end