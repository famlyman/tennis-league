class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy mens_doubles womens_doubles mixed_doubles mens_singles womens_singles ]

  # GET /matches or /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1 or /matches/1.json
  def show
    @match = Match.find(params[:id])
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches or /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to match_url(@match), notice: "Match was successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def mens_doubles
    # Assuming params[:match] contains the set scores
    set_match_scores(params[:match])
  
    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def womens_doubles
    set_match_scores(params[:match])
  
    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def mixed_doubles
    set_match_scores(params[:match])
  
    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def mens_singles
    set_match_scores(params[:match])
  
    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def womens_singles
    set_match_scores(params[:match])
  
    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_scores
    @match = Match.find(params[:id])
    set_match_scores(params[:match])

    respond_to do |format|
      if @match.save
        format.html { redirect_to match_url(@match), notice: "Match scores were successfully updated." }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    def set_match_scores(scores)
      puts "DEBUG: Scores parameter received: #{scores.inspect}"
      # Initialize total scores for home and away teams
      home_team_total = 0
      away_team_total = 0
    
      # Define an array of all the set keys
      set_keys = [
        'home_mens_doubles_set1_score', 'away_mens_doubles_set1_score',
        'home_mens_doubles_set2_score', 'away_mens_doubles_set2_score',
        'home_mens_doubles_set3_score', 'away_mens_doubles_set3_score',
        'womens_doubles_set1_score', 'womens_doubles_set2_score', 'womens_doubles_set3_score',
        'mixed_doubles_set1_score', 'mixed_doubles_set2_score', 'mixed_doubles_set3_score',
        'mens_singles_set1_score', 'mens_singles_set2_score', 'mens_singles_set3_score',
        'womens_singles_set1_score', 'womens_singles_set2_score', 'womens_singles_set3_score'
      ]
    
      set_keys.each do |set_key|
        # Get the score from the params
        score = scores[set_key].to_i
    
        # Update the total scores
        if set_key.include?('home')
          home_team_total += score
        else
          away_team_total += score
        end
      end
    
      # Assign the total scores to the match
      @match.home_team_score = home_team_total
      @match.away_team_score = away_team_total
    end
    

    def calculate_set_score(player1_score, player2_score)
      if player1_score > player2_score
        return 1
      elsif player1_score < player2_score
        return 2
      else
        return 0
      end
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.require(:match).permit(:home_team_id, :away_team_id, :start_time, :league_id, :home_team_score, :away_team_score)
    end
end
