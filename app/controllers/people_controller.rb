class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  def index = @people = Person.all

  def show
    @detail = @person.detail
    render layout: false
  end

  def new
    @person = Person.new
    @person.build_detail
  end

  def edit; end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      return format.turbo_stream { flash.now[:notice] = "Person was successfully created." } if @person.save

      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def update
    respond_to do |format|
      return format.turbo_stream { flash.now[:notice] = "Person was successfully updated." } if @person.update(person_params)

      format.html { render :edit, status: :unprocessable_entity }
    end
  end

  def destroy
    @person.destroy

    redirect_to people_url, notice: "Person was successfully destroyed."
  end

  private

  def set_person = @person = Person.find(params[:id])

  def person_params = params.require(:person).permit(:name, detail_attributes: %i(email title phone))
end
