class AssistantCourse < ApplicationRecord
  belongs_to :assistant, class_name: "User", foreign_key: "assistant_id"
  belongs_to :course
end
