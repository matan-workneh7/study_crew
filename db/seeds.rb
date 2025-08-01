# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Comprehensive course list
[
  { name: 'Introduction to Programming', code: 'SE101', credit_hour: 3, year: 'Freshman', semester: 1, description: 'Fundamentals of programming using a high-level language.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Discrete Mathematics', code: 'SE102', credit_hour: 3, year: 'Freshman', semester: 1, description: 'Mathematical foundations for computer science.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Computer Fundamentals', code: 'SE103', credit_hour: 3, year: 'Freshman', semester: 1, description: 'Introduction to computer systems and architecture.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Calculus I', code: 'MATH101', credit_hour: 4, year: 'Freshman', semester: 1, description: 'Differential and integral calculus.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Technical Writing', code: 'ENG101', credit_hour: 2, year: 'Freshman', semester: 1, description: 'Effective technical communication skills.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Object-Oriented Programming', code: 'SE106', credit_hour: 3, year: 'Freshman', semester: 2, description: 'Principles of object-oriented programming.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Data Structures', code: 'SE107', credit_hour: 3, year: 'Freshman', semester: 2, description: 'Fundamental data structures and algorithms.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Digital Logic Design', code: 'SE108', credit_hour: 3, year: 'Freshman', semester: 2, description: 'Digital systems and logic design.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Calculus II', code: 'MATH102', credit_hour: 4, year: 'Freshman', semester: 2, description: 'Advanced calculus topics.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Communication Skills', code: 'ENG102', credit_hour: 2, year: 'Freshman', semester: 2, description: 'Professional communication skills.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Algorithms', code: 'SE201', credit_hour: 3, year: 'Sophomore', semester: 1, description: 'Design and analysis of algorithms.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Database Systems', code: 'SE202', credit_hour: 3, year: 'Sophomore', semester: 1, description: 'Introduction to database design and management.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Computer Organization', code: 'SE203', credit_hour: 3, year: 'Sophomore', semester: 1, description: 'Computer system organization and architecture.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Linear Algebra', code: 'MATH201', credit_hour: 3, year: 'Sophomore', semester: 1, description: 'Matrix algebra and vector spaces.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Web Development', code: 'SE205', credit_hour: 3, year: 'Sophomore', semester: 2, description: 'Front-end and back-end web development.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Operating Systems', code: 'SE206', credit_hour: 3, year: 'Sophomore', semester: 2, description: 'Principles of operating systems.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Software Engineering I', code: 'SE207', credit_hour: 3, year: 'Sophomore', semester: 2, description: 'Introduction to software engineering principles.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Probability and Statistics', code: 'MATH202', credit_hour: 3, year: 'Sophomore', semester: 2, description: 'Probability theory and statistical methods.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Software Requirements Engineering', code: 'SE301', credit_hour: 3, year: 'Junior', semester: 1, description: 'Requirements elicitation and analysis.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Computer Networks', code: 'SE302', credit_hour: 3, year: 'Junior', semester: 1, description: 'Network architectures and protocols.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Software Design and Architecture', code: 'SE303', credit_hour: 3, year: 'Junior', semester: 1, description: 'Software design patterns and architectures.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Mobile Application Development', code: 'SE304', credit_hour: 3, year: 'Junior', semester: 2, description: 'Developing applications for mobile platforms.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Software Testing', code: 'SE305', credit_hour: 3, year: 'Junior', semester: 2, description: 'Software testing techniques and methodologies.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Human-Computer Interaction', code: 'SE306', credit_hour: 3, year: 'Junior', semester: 2, description: 'Principles of user interface design.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Artificial Intelligence', code: 'SE402', credit_hour: 3, year: 'Senior', semester: 1, description: 'Fundamentals of AI and machine learning.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Cloud Computing', code: 'SE403', credit_hour: 3, year: 'Senior', semester: 2, description: 'Cloud architectures and services.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Cybersecurity', code: 'SE404', credit_hour: 3, year: 'Senior', semester: 2, description: 'Principles of information security.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Capstone Project I', code: 'SE501', credit_hour: 3, year: 'Graduate', semester: 1, description: 'First part of the capstone software project.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Professional Practices', code: 'SE502', credit_hour: 2, year: 'Graduate', semester: 1, description: 'Ethics and professional responsibilities.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Capstone Project II', code: 'SE503', credit_hour: 3, year: 'Graduate', semester: 2, description: 'Completion and presentation of capstone project.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' },
  { name: 'Entrepreneurship in Software', code: 'SE504', credit_hour: 2, year: 'Graduate', semester: 2, description: 'Starting and managing a software business.', created_at: '2025-07-05 15:33:47', updated_at: '2025-07-05 15:33:47' }
].each do |course_attrs|
  Course.find_or_create_by!(code: course_attrs[:code]) do |course|
    course.assign_attributes(course_attrs)
  end
end
