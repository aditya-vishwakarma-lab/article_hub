class ReadersController < ApplicationController

  before_action :set_reader, only: %i[ edit update]
  def index
    @readers = Reader.all
  end

  def edit
  end

  def create
    @reader = Reader.new(reader_params)
    respond_to do |format|
      if @reader.save
        format.html { redirect_to edit_reader_path(@reader), notice: "reader was successfully created." }
        format.json { render :show, status: :created, location: @reader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reader.update(reader_params)
        format.html { redirect_to edit_reader_path(@reader), notice: "reader was successfully updated." }
        format.json { render :show, status: :ok, location: @reader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reader
      @reader = Reader.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def reader_params
      params.require(:reader).permit(:email, :blocked)
    end

end
