class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    # binding.pry
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = 'Curso criado com sucesso!'
      redirect_to courses_path
    else
      flash.now[:error] = 'Erro ao criar curso.'
      render :new
    end
  end

  private

  def course_params
    params.require(:course)
        .permit(:teacher_id, :name, :value, :description, :syllabus)
  end
end
