class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :courses, dependent: :destroy

  # User roles
  enum :role, { learner: 0, designer: 1, admin: 2 }

  # Validations
  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :role, presence: true

  # Helper methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def designer?
    role == "designer" || role == "admin"
  end

  def learner?
    role == "learner"
  end

  def admin?
    role == "admin"
  end
end
