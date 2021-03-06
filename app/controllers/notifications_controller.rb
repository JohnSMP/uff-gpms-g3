class NotificationsController < ApplicationController
  load_and_authorize_resource

  before_action :find_notification, only: [:update, :destroy]

  def index
    @notifications = Notification.by_student(helpers.current_user.student.id)
  end

  def update
    @notification.update(read: true)
    course = @notification.course
    return redirect_to course_path(course) if params[:to_course] == 'true'
    redirect_to lesson_path(@notification.lesson)
  end

  def destroy
    @notification.destroy
    redirect_to notifications_path
  end

  private

  def find_notification
    @notification = Notification.find(params[:id])
  end
end
