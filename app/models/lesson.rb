class Lesson < ApplicationRecord
  belongs_to :course
  has_many :content_blocks, dependent: :destroy
  
  enum :lesson_type, { content: 0, assessment: 1 }
  
  validates :title, presence: true
  validates :position, presence: true, uniqueness: { scope: :course_id }
  
  scope :ordered, -> { order(:position) }
  
  def next_lesson
    course.lessons.where('position > ?', position).order(:position).first
  end
  
  def previous_lesson
    course.lessons.where('position < ?', position).order(:position).last
  end
end
