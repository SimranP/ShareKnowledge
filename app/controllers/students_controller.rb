class StudentsController < ApplicationController
  def all
    @students = Student.all
    @students.each {
        |student|
      students_data = []
      if !File.file? 'app/'+'assets/'+'images/'+student.picture.to_s
        student.picture = "default.png"
      end
      students_data << student
    }
    @students_data
  end

  def new
    if current_user == nil
      redirect_to "/auth/facebook"
    else
     @student = Student.new
    end
  end



  def create
    copy_image student_params
    @student = Student.new(assign_details)
    if @student.save
      redirect_to "", :notice=> "Student details has been sent for verification."
    else
      render "new"
    end
  end

  private
  def assign_details
    students_details = Hash.new
    students_details[:name] = student_params[:name]
    students_details[:dob] = student_params[:dob]
    students_details[:address] = student_params[:address]
    students_details[:gender] = student_params[:gender]
    students_details[:contact] = student_params[:contact]
    students_details[:guardian] = student_params[:guardian]
    students_details[:interest] = student_params[:interest]
    students_details[:picture] = student_params[:picture] ? student_params[:picture].original_filename : "default.png"
    students_details
  end

  private
  def copy_image params
    if params[:picture]
      tmp = params[:picture].tempfile
      destiny_file = File.join('app','assets','images', params[:picture].original_filename)
      FileUtils.move tmp.path, destiny_file
    end
  end



  private
  def student_params
    params.require(:student).permit(:name, :dob, :address, :gender, :contact, :guardian, :interest, :picture)
  end
end
