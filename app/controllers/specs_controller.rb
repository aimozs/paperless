class SpecsController < ApplicationController
  before_action :set_spec, only: [:remove, :show, :edit, :update, :destroy]
  

  # GET /specs
  # GET /specs.json
  def index
    @specs = Spec.all
  end

  # GET /specs/1
  # GET /specs/1.json
  def show
  end

  def remove
    @spec.delete
    redirect_to :back
  end

  # GET /specs/new
  def new
    @spec = Spec.new
    if params[:programme]
      @programme_id = params[:programme]
    else
      redirect_to :back
    end
  end

  # GET /specs/1/edit
  def edit
    
  end

  # POST /specs
  # POST /specs.json
  def create
    @spec = Spec.new(spec_params)

    respond_to do |format|
      if @spec.save
        format.html { redirect_to :back, notice: 'Spec was successfully created.' }
        format.json { render :show, status: :created, location: @spec }
      else
        format.html { render :new }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specs/1
  # PATCH/PUT /specs/1.json
  def update
    respond_to do |format|
      if @spec.update(spec_params)
        format.html { redirect_to @spec.programme, notice: 'Spec was successfully updated.' }
        format.json { render :show, status: :ok, location: @spec }
      else
        format.html { render :edit }
        format.json { render json: @spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specs/1
  # DELETE /specs/1.json
  def destroy
    @spec.destroy
    respond_to do |format|
      format.html { redirect_to specs_url, notice: 'Spec was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec
      @spec = Spec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spec_params
      params.require(:spec).permit(:time, :weight, :set, :rep, :tempo, :weight_cl, :rep_cl, :set_cl, :note, :programme_id, :exercise_id)
    end
end
