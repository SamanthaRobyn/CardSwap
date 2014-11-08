class BusinesscardsController < ApplicationController

  before_action :set_businesscard, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @user = User.find(@user.id)
   # @businesscards = User.businesscards
  end

  # GET /businesscards/1
  # GET /businesscards/1.json
  def show
  end

  # GET /businesscards/new
  def new
    @businesscard = Businesscard.new
  end

  # GET /businesscards/1/edit
  def edit
  end

  # POST /businesscards
  # POST /businesscards.json
  def create
    @user = current_user
    @user = User.find(@user.id)

    @user.businesscards << Businesscard.new(businesscard_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/businesscards'}#@businesscard }
        format.json { render action: 'show', status: :created, location: @businesscard }
      else
        format.html { render action: 'new' }
        format.json { render json: @businesscard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesscards/1
  # PATCH/PUT /businesscards/1.json
  def update
    respond_to do |format|
      if @businesscard.update(businesscard_params)
        format.html { redirect_to @businesscard, notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @businesscard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesscards/1
  # DELETE /businesscards/1.json
  def destroy
    @businesscard.destroy
    respond_to do |format|
      format.html { redirect_to businesscards_path }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_businesscard
      @businesscard = Businesscard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def businesscard_params
      params.require(:businesscard).permit(:street, :city, :state, :zip_code, :country, :primary_email, :email, :first_name, :last_name, :middle_name, :company, :title, :primary_phone, :work_phone, :cell_phone, :linkedin, :facebook, :twitter, :instagram, :website, :background)
    end
end


