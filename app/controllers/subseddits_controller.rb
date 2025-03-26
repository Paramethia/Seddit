class SubsedditsController < ApplicationController
  before_action :set_subseddit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  # GET /subseddits or /subseddits.json
  def index
    @subseddits = Subseddit.order(people: :desc)
  end

  # GET /subseddits/1 or /subseddits/1.json
  def show
    @seds = @subseddit.seds
    @point = Point.new
  end

  # GET /subseddits/new
  def new
    @subseddit = Subseddit.new
  end

  # GET /subseddits/1/edit
  def edit
  end

  # POST /subseddits or /subseddits.json
  def create
    @subseddit = Subseddit.new(subseddit_params)
    @subseddit.owner = current_user.username
    @subseddit.user_id = current_user.id

    respond_to do |format|
      if @subseddit.save
        format.html { redirect_to @subseddit, notice: "Subseddit created" }
        format.json { render :show, status: :created, location: @subseddit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subseddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subseddits/1 or /subseddits/1.json
  def update
    if current_user && current_user.id == @subseddit.user_id
      respond_to do |format|
        if @subseddit.update(subseddit_params)
          format.html { redirect_to @subseddit, notice: "Subseddit updated" }
          format.json { render :show, status: :ok, location: @subseddit }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @subseddit.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /subseddits/1 or /subseddits/1.json
  def destroy
    if current_user && current_user.id == @subseddit.user_id
      @subseddit.destroy!

      respond_to do |format|
        format.html { redirect_to subseddits_path, status: :see_other, notice: "Subseddit deleted" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subseddit
      @subseddit = Subseddit.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subseddit_params
      params.expect(subseddit: [:name, :description])
      #params.require(:subseddit).permit(:title, :description)
    end
end
