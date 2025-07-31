export interface User {
  id: string;
  username: string;
  email: string;
  user_role: 'student' | 'assist';
  academic_year: string;
}

export interface SignupFormData {
  username: string;
  email: string;
  password: string;
  confirm_password: string;
  academic_year: string;
  user_role: 'student' | 'assist';
}

export {}