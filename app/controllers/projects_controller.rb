class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.order("name")
    #render :layout => false
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find params[:id]
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.where("id = ?",params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    @project.name = params[:project][:name]
    @project.start_date = Date.civil(params[:project][:"start_date(1i)"].to_i,params[:project][:"start_date(2i)"].to_i,params[:project][:"start_date(3i)"].to_i)
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        redirect_to(@project)
      else
        flash.now[:error] = "Something went wrong, Please try again!"
        render :action => "new"
      end
    end
  

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.where("id = ?",params[:id])

    
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        redirect_to(@project)
      else
        flash.now[:error] = "Something went wrong, please try again!"
        render :action => "edit"
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.where("id = ?",params[:id])
    @project.destroy
    redirect_to(projects_url)
  end

end
