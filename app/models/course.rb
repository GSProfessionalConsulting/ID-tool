class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  
  enum :status, { draft: 0, published: 1, archived: 2 }
  
  validates :title, presence: true
  
  def total_lessons
    lessons.count
  end
  
  def published_lessons
    lessons.where.not(lesson_type: 'assessment')
  end
  
  def assessment_lessons
    lessons.where(lesson_type: 'assessment')
  end
end
