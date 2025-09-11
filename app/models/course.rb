class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy

  enum :status, { draft: 0, published: 1, archived: 2 }

  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :status, presence: true
  validates :target_audience, length: { maximum: 255 }, allow_blank: true
  validates :estimated_duration, length: { maximum: 100 }, allow_blank: true
  validates :learning_objectives, length: { maximum: 2000 }, allow_blank: true

  def total_lessons
    lessons.count
  end

  def published_lessons
    lessons.where.not(lesson_type: "assessment")
  end

  def assessment_lessons
    lessons.where(lesson_type: "assessment")
  end
end
