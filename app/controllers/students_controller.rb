class StudentsController < ApplicationController
  def all
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    p {@student.inspect?}
    if @student.save
      redirect_to ""
    else
      render "new"
    end

  end

  private
  def student_params
    params.require(:student).permit(:name, :dob, :address, :gender, :contact, :guardian, :interest)
  end

end
