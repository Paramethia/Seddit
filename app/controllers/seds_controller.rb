class SedsController < ApplicationController
  before_action :set_sed, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create create_comment update destroy ascend descend ]

  # GET /seds or /seds.json
  def index
    @seds = Sed.order(point: :desc)
    @point = Point.new
    @comment = Comment.new
  end

  # GET /seds/1 or /seds/1.json
  def show
    @sed = Sed.friendly.find(params[:id])
    @point = Point.new
    @comment = Comment.new
    @comments = @sed.comments
  end

  # GET /seds/new
  def new
    @sed = Sed.new
    @subseddit = Subseddit.find_by(name: params[:subseddit_id])
    @subseddits = Subseddit.all
  end

  def ascend 
    @sed = Sed.find_by(title: params[:id])
    @point = current_user.points.find_by(sed: @sed)

    if @point&.value == 1
      @point.destroy
    else 
      @point = current_user.points.find_or_initialize_by(sed: @sed)
      @point.value = 1
      @point.save
    end

    @sed.update(point: @sed.points.sum(:value))
    redirect_back(fallback_location: root_path)
  end

  def descend
    @sed = Sed.find_by(title: params[:id])
    @point = current_user.points.find_by(sed: @sed)
    
    if @point&.value == -1
      @point.destroy
    else
      @point = current_user.points.find_or_initialize_by(sed: @sed)
      @point.value = -1
      @point.save
    end

    @sed.update(point: @sed.points.sum(:value))

    redirect_back(fallback_location: root_path)
  end

  def create_comment
    @sed = Sed.friendly.find(params[:id]);
    @comment = @sed.comments.build(comment_params);
    @comment.commenter = current_user.username
    @comment.user_id = current_user.id
    
    if @comment.save
      respond_to do |format|
        #format.html { redirect_to @sed, notice: "Comment added!" }
        format.turbo_stream
      end
    else
      flash[:error] = "Comment could not be saved"
      redirect_back(fallback_location: @sed)
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end 

  def delete_comment
    @comment = Comment.find(params[:comment_id])
    
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to sed_path(params[:id]), notice: "Comment deleted."
    else
      redirect_to sed_path(params[:id]), alert: "You can only delete your own comments."
    end
  end  

  # GET /seds/1/edit
  def edit
  end

  # POST /seds or /seds.json
  def create
    @subseddits = Subseddit.all

    @sed = Sed.new(sed_params)
    @sed.sedder = current_user.username
    @sed.user_id = current_user.id
    
    @subseddit = Subseddit.find_by(name: params[:sed][:subseddit_name])
    @sed.subseddit_id = @subseddit.id if @subseddit

    respond_to do |format|
      if @sed.save
        format.html { redirect_to @sed, notice: "Sed created!" }
        format.json { render :show, status: :created, location: @sed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seds/1 or /seds/1.json
  def update
    if current_user && current_user.id == @sed.user_id
      respond_to do |format|
        if @sed.update(sed_params)
          format.html { redirect_to @sed, notice: "Sed updated!" }
          format.json { render :show, status: :ok, location: @sed }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @sed.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /seds/1 or /seds/1.json
  def destroy
    if current_user && current_user.id == @sed.user_id
      @sed.destroy!

      respond_to do |format|
        format.html { redirect_to seds_path, status: :see_other, notice: "Sed deleted" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sed
      #@sed = Sed.friendly.find(params.expect(:id))
      @sed = Sed.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sed_params
      params.expect(sed: [ :title, :content, :image, :subseddit_name ])
      #params.require(:sed).permit(:title, :content, :sedder: :subseddit_name)
    end
end
