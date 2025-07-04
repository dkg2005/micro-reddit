class SubredditsController < ApplicationController
  before_action :set_subreddit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new ]
  
  # GET /subreddits or /subreddits.json
  def index
    @subreddits = Subreddit.all
  end

  # GET /subreddits/1 or /subreddits/1.json
  def show
    @subreddit = Subreddit.friendly.find(params[:id])
  end

  # GET /subreddits/new
  def new
    @subreddit = Subreddit.new
  end

  # GET /subreddits/1/edit
  def edit
  end

  # POST /subreddits or /subreddits.json
  def create
    @subreddit = Subreddit.new(subreddit_params)

    respond_to do |format|
      if @subreddit.save
        format.html { redirect_to @subreddit, notice: "Subreddit was successfully created." }
        format.json { render :show, status: :created, location: @subreddit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subreddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subreddits/1 or /subreddits/1.json
  def update
    respond_to do |format|
      if @subreddit.update(subreddit_params)
        format.html { redirect_to @subreddit, notice: "Subreddit was successfully updated." }
        format.json { render :show, status: :ok, location: @subreddit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subreddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subreddits/1 or /subreddits/1.json
  def destroy
    @subreddit.destroy!

    respond_to do |format|
      format.html { redirect_to subreddits_path, status: :see_other, notice: "Subreddit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subreddit
      @subreddit = Subreddit.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def subreddit_params
      params.expect(subreddit: [ :title, :body, :user_id ])
    end
end
