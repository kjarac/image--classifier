class PagesController < ApplicationController
  def home
    @photos =  Photo.all.where(:label => "")
  end
end