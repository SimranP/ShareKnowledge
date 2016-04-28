class StudentsController < ApplicationController
  def all
    @students = Student.all
  end

  def new
    p current_user  ,"============================"
    if current_user == nil
      redirect_to "/auth/facebook"
    else
     @student = Student.new
    end
  end

  def create
    @student = Student.new(student_params)
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
