class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :assistant , class_name: "User", foreign_key: "assistant_id"

  validates :user_id, presence: true
  validates :assistant_id, presence: true
  validates :status, inclusion: {in: %w[ pending accepted rejected]}
  validates :telegram_username, presence: true
  validates :course_ids, presence: true
  validates :problem_description, presence: true, length: { maximum: 100 }, allow_nil: true

  validate :same_user
  validate :user_role_is_user
  validate :assistant_role_is_assistant
  validates :user_id, uniqueness: { scope: [:assistant_id, :course_ids, :problem_description], message: "Connection already exists for this user, assistant, course(s), and problem description." }

  private

  def same_user
    errors.add(:user_id, "User cannot be the same as assistant") if user_id == assistant_id
  end

  def user_role_is_user
    user_record = User.find_by(id: user_id)
    if user_record && user_record.role != 'user'
      errors.add(:user_id, 'must refer to a user with role user')
    end
  end

  def assistant_role_is_assistant
    assistant_record = User.find_by(id: assistant_id)
    if assistant_record && assistant_record.role != 'assistant'
      errors.add(:assistant_id, 'must refer to a user with role assistant')
    end
  end
end