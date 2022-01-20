class PagesController < ApplicationController
  def landing
    @services = Service.all.order('created_at DESC')
  end
end
