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

  private

  def same_user
    errors.add(:user_id, "User cannot be the same as assistant") if user_id == assistant_id
  end

end