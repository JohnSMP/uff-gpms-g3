class Lesson < ApplicationRecord
  belongs_to :course

  has_many :lesson_students
  has_many :notifications

  acts_as_commontable dependent: :destroy

  validates :title, :position, :video_url, :description, presence: true

  # course_id && position
  validates :position, uniqueness: { scope: :course_id }

  scope :by_course, ->(course_id) { where(course_id: course_id) }
  scope :order_by_position, -> { order(position: :asc) }
end
