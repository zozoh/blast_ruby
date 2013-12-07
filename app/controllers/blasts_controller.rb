class BlastsController < ApplicationController
  before_action :set_blast, only: [:show, :edit, :update, :destroy]

  # GET /blasts
  # GET /blasts.json
  def index
    @blasts = Blast.all

    hudson = Blast.create(
      cnt: 'Harry',
      picurl: "http://img2.moko.cc/users/14/4460/1338071/post/a3/img2_cover_8462323.jpg",
      lv: 300,
      # when setting array LONGITUDE MUST BE FIRST LATITUDE MUST BE SECOND
      # source: [-73.935833,44.106667],
      # but we can use hash in any order,
      # the default keys for latitude and longitude are :lat and :lng respectively
      # source: {:lat => 44.106667, :lng => -73.935833},
      lo: [116.4154, 39.9372]
    )
  end

  # GET /blasts/1
  # GET /blasts/1.json
  def show
    @blasts = Blast.limit(1).geo_near([116.4154, 39.9372]).max_distance(0.005)
    binding.pry
  end

  # GET /blasts/new
  def new
    @blast = Blast.new
  end

  # GET /blasts/1/edit
  def edit
  end

  # POST /blasts
  # POST /blasts.json
  def create
    @blast = Blast.new(blast_params)

    respond_to do |format|
      if @blast.save
        format.html { redirect_to @blast, notice: 'Blast was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blast }
      else
        format.html { render action: 'new' }
        format.json { render json: @blast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blasts/1
  # PATCH/PUT /blasts/1.json
  def update
    respond_to do |format|
      if @blast.update(blast_params)
        format.html { redirect_to @blast, notice: 'Blast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blasts/1
  # DELETE /blasts/1.json
  def destroy
    @blast.destroy
    respond_to do |format|
      format.html { redirect_to blasts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blast
      @blast = Blast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blast_params
      params.require(:blast).permit(:content, :picture)
    end
end
