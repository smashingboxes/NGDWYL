class EntriesController < ActionController::Base

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:success] = "Goal submitted!"
    else
      flash[:error] = @entry.errors.full_messages
    end
    respond_to do |format|
      format.html { render json: @entry }
    end
  end

  def show
    @entry = Entry.find(params[:id])
    respond_to do |format|
      format.json { render json: @entry }
    end
  end

  def index
    @entries = Entry.all
    respond_to do |format|
      format.json { render json: @entries }
    end
  end

  def random
    @entry = Entry.order("RANDOM()").first
    respond_to do |format|
      format.json { render json: @entry }
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:goal, :submitted_by)
  end

end
