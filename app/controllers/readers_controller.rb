class ReadersController < ApplicationController
  load_and_authorize_resource
  before_action :set_reader, only: %i[ edit update]
  after_action :store_blocked_user, only: %i[update]
  def index
    @readers = Reader.all
  end

  def edit
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

    def store_blocked_user
      StoreBlockedUserJob.perform_later @reader.blocked, @reader.email
    end
end
