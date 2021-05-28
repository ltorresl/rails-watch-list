class ListsController < ApplicationController
  before_action :set_list, except: %i[index new create]

  # CREATE
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # READ
  def index
    @lists = List.all
  end

  def show
  end

  # UPDATE
  def edit
  end

  def update
    @list.update(list_params)

    redirect_to lists_path
  end

  # DELETE
  def destroy
    @list.destroy

    redirect_to lists_path, notice: 'List was successfully deleted.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
