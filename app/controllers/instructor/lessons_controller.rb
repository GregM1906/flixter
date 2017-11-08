class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = current_section.lessons.create(lesson_params)
    redirect_to instructor_course_path(current_section.course)
  end

  private
  
  def require_authorized_for_current_section
    if current_section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  
#  this line of code
#  ====>
#          @current_section ||=
#  does the same thing as all of these lines of code
#  ====>
#          
#  if @current_section == nil
#    @current_section = Section.find(params[:section_id])
#    @current_section
#  else
#    @current_section
#  end
#  
#  In short, this single line ( @current_section ||= ) says: if we've looked up the current_section beforehand use the value that we looked up previously. If we haven't looked up this section before, go into the database, look it up and also make sure to remember the value in case we need to look it up again later. This technique of storing certain values inside of the memory to reduce the times we have to find a certain value inside the database is called memoization.
#
  
  def lesson_params
    params.required(:lesson).permit(:title, :subtitle)
  end
end
