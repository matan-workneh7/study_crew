class AssistantCourse < ApplicationRecord
  belongs_to :assistant
  belongs_to :course
end
