class User < ApplicationRecord
  
    has_secure_password
    
    #used to define the assistant and their courses
    has_many :assistant_courses, foreign_key: :assistant_id
    has_many :courses, through: :assistant_courses, source: :course
    

    #used to define the connections of a user(learner) and its assistant
    has_many :connections, dependent: :destroy
    has_many :assistants, through: :connections, source: :assistant

    #used to define the connections of a user(learner) and its assistant
    has_many :received_connections, class_name:'Connection', foreign_key: :assistant_id, dependent: :destroy
    has_many :learners, through: :received_connections, source: :user
    
    
    validates :name, presence: true
    validates :email, uniqueness:true
    validates :role, presence: true, inclusion: { in: %w[ user assistant ] }
    validates :academic_year, presence: true
    validates :password, presence:true, length: { minimum: 8 }
    
    def assistant?
        role == "assistant"
    end

    def user?
      role == "user"
    end
end