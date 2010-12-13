class DashboardController < ApplicationController

  #Expected to contain lists of Projects, Stories..etc.
  #Currently detects if user is logged in or not.
  #Displays a status and a few links.
  def index
    @projects = Project.all
    #render :layout => false
  end

  #Not implemented yet
  def settings
  end

end
