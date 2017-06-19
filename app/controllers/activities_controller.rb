class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do

        render  :pdf => "your-filename", :template => '/activities/show.html.erb', header: {template: "layout/_header.html.erb"}
      end
    end
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to boards_path, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to boards_path, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to boards_path, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move_right
    @activity = Activity.find(params[:id])
    case @activity.state
    when "todo"
      puts @activity.state
      @activity.state = "doing"
      puts @activity.state
    when "doing"
      @activity.state = "reviewing"
    when "reviewing"
      @activity.state = "done"
    else
      # foda-se
    end
    @activity.save
    redirect_to boards_path
  end

  def move_left
    @activity = Activity.find(params[:id])
    case @activity.state
    when "done"
      @activity.state = "reviewing"
    when "reviewing"
      @activity.state = "doing"
    when "doing"
      @activity.state = "todo"
    else
      # foda-se
    end
    @activity.save
    redirect_to boards_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :state, :description, :owner)
    end
end
