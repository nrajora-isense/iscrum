class StoriesController < ApplicationController
  before_filter :fill_select_boxes, :only => [ :new, :edit ]


  def fill_select_boxes
    @story_types = { 'Feature' => "Feature", 'Bug' => "Bug", 'Chore' => "Chore", 'Release' => "Release" }
    @current_states = { "Not yet started" => "uncheduled", "Accepted" => "Accepted", "Declined" => "Declined", "Started" => "Started", "Finished" => "Finished", "Delivered" => "Delivered", "Rejected" => "Rejected" }
    @estimate_options = { "Unestimated" => -1, "0 points" => 0, "1 point" => 1, "2 points" => 2, "3 points" => 3 }
  end

  # GET /stories
  # GET /stories.xml
  def index
    @stories = Story.order("title")
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.where("id = ?",params[:id])
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
    @story = Story.where("id = ?",params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])

      if @story.save
        flash[:notice] = 'Story was successfully created.'
        redirect_to stories_path
      else
        render :action => "new" 
      end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.where("id = ?",params[:id])
    @story.user = current_user
   
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        redirect_to root_path
      else
        render :action => "edit" 
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.where("id = ?",params[:id])
    @story.destroy
  redirect_to(stories_url)
  end
end
