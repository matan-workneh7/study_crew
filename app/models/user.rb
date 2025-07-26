class User < ApplicationRecord
  has_secure_password

  has_many :assistant_course, foreign_key: :assistant_id

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w[ user assistant ] }
  validates :academic_year, presence: true
  validates :password, presence: true, length: { minimum: 8 }

  def assistant?
    role == "assistant"
  end

  def user?
    role == "user"
  end
end
