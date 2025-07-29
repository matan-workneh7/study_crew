require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:assistant) { create(:assistant) }
  let(:other_user) { create(:user) }

  before do
    # Mock the current_user method
    allow(controller).to receive(:current_user).and_return(nil)
  end

  describe 'GET #index' do
    context 'when user is an assistant' do
      before do
        allow(controller).to receive(:current_user).and_return(assistant)
      end

      it 'returns a successful response' do
        get :index
        expect(response).to be_successful
      end

      it 'assigns @users' do
        get :index
        expect(assigns(:users)).to eq(User.all)
      end
    end

    context 'when user is not an assistant' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to root path' do
        get :index
        expect(response).to redirect_to(root_path)
      end

      it 'sets an alert message' do
        get :index
        expect(flash[:alert]).to eq('Access denied. Only assistants can view all users.')
      end
    end

    context 'when user is not logged in' do
      it 'redirects to root path' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is an assistant' do
      before do
        allow(controller).to receive(:current_user).and_return(assistant)
      end

      it 'returns a successful response' do
        get :show, params: { id: user.id }
        expect(response).to be_successful
      end

      it 'assigns @user' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'when user is viewing their own profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'returns a successful response' do
        get :show, params: { id: user.id }
        expect(response).to be_successful
      end
    end

    context 'when user is viewing another user profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to root path' do
        get :show, params: { id: other_user.id }
        expect(response).to redirect_to(root_path)
      end

      it 'sets an alert message' do
        get :show, params: { id: other_user.id }
        expect(flash[:alert]).to eq('Access denied. You can only view your own profile.')
      end
    end

    context 'when user is not found' do
      before do
        allow(controller).to receive(:current_user).and_return(assistant)
      end

      it 'redirects to users path' do
        get :show, params: { id: 99999 }
        expect(response).to redirect_to(users_path)
      end

      it 'sets an alert message' do
        get :show, params: { id: 99999 }
        expect(flash[:alert]).to eq('User not found.')
      end
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) do
      {
        name: 'John Doe',
        email: 'john@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        role: 'user',
        academic_year: 2
      }
    end

    let(:invalid_attributes) do
      {
        name: '',
        email: 'invalid-email',
        password: 'short',
        password_confirmation: 'short',
        role: 'invalid_role',
        academic_year: nil
      }
    end

    context 'with valid parameters' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(User.last)
      end

      it 'sets a notice message' do
        post :create, params: { user: valid_attributes }
        expect(flash[:notice]).to eq('User was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect {
          post :create, params: { user: invalid_attributes }
        }.not_to change(User, :count)
      end

      it 'renders the new template' do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template(:new)
      end

      it 'returns unprocessable entity status' do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #edit' do
    context 'when user is an assistant' do
      before do
        allow(controller).to receive(:current_user).and_return(assistant)
      end

      it 'returns a successful response' do
        get :edit, params: { id: user.id }
        expect(response).to be_successful
      end

      it 'assigns @user' do
        get :edit, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'when user is editing their own profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'returns a successful response' do
        get :edit, params: { id: user.id }
        expect(response).to be_successful
      end
    end

    context 'when user is editing another user profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to root path' do
        get :edit, params: { id: other_user.id }
        expect(response).to redirect_to(root_path)
      end

      it 'sets an alert message' do
        get :edit, params: { id: other_user.id }
        expect(flash[:alert]).to eq('Access denied. You can only edit your own profile.')
      end
    end
  end

  describe 'PATCH #update' do
    let(:new_attributes) do
      {
        name: 'Updated Name',
        email: 'updated@example.com',
        academic_year: 3
      }
    end

    let(:invalid_attributes) do
      {
        name: '',
        email: 'invalid-email'
      }
    end

    context 'when user is an assistant' do
      before do
        allow(controller).to receive(:current_user).and_return(assistant)
      end

      context 'with valid parameters' do
        it 'updates the requested user' do
          patch :update, params: { id: user.id, user: new_attributes }
          user.reload
          expect(user.name).to eq('Updated Name')
          expect(user.email).to eq('updated@example.com')
        end

        it 'redirects to the user' do
          patch :update, params: { id: user.id, user: new_attributes }
          expect(response).to redirect_to(user)
        end

        it 'sets a notice message' do
          patch :update, params: { id: user.id, user: new_attributes }
          expect(flash[:notice]).to eq('User was successfully updated.')
        end
      end

      context 'with invalid parameters' do
        it 'renders the edit template' do
          patch :update, params: { id: user.id, user: invalid_attributes }
          expect(response).to render_template(:edit)
        end

        it 'returns unprocessable entity status' do
          patch :update, params: { id: user.id, user: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when user is updating their own profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      context 'with valid parameters' do
        it 'updates the user' do
          patch :update, params: { id: user.id, user: new_attributes }
          user.reload
          expect(user.name).to eq('Updated Name')
        end
      end
    end

    context 'when user is updating another user profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to root path' do
        patch :update, params: { id: other_user.id, user: new_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user_to_delete) { create(:user) }

    context 'when user is an assistant' do
      before do
        allow(controller).to receive(:current_user).and_return(assistant)
      end

      it 'destroys the requested user' do
        expect {
          delete :destroy, params: { id: user_to_delete.id }
        }.to change(User, :count).by(-1)
      end

      it 'redirects to the users list' do
        delete :destroy, params: { id: user_to_delete.id }
        expect(response).to redirect_to(users_url)
      end

      it 'sets a notice message' do
        delete :destroy, params: { id: user_to_delete.id }
        expect(flash[:notice]).to eq('User was successfully deleted.')
      end
    end

    context 'when user is deleting their own profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user_to_delete)
      end

      it 'destroys the user' do
        expect {
          delete :destroy, params: { id: user_to_delete.id }
        }.to change(User, :count).by(-1)
      end
    end

    context 'when user is deleting another user profile' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to root path' do
        delete :destroy, params: { id: user_to_delete.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'private methods' do
    describe '#user_params' do
      context 'when current user is an assistant' do
        before do
          allow(controller).to receive(:current_user).and_return(assistant)
        end

        it 'permits all user attributes including role' do
          params = ActionController::Parameters.new(
            user: {
              name: 'Test',
              email: 'test@example.com',
              password: 'password123',
              password_confirmation: 'password123',
              role: 'assistant',
              academic_year: 2
            }
          )
          allow(controller).to receive(:params).and_return(params)
          
          # We can't directly test private methods, but we can test the behavior
          # through the update action
          patch :update, params: { id: user.id, user: { role: 'assistant' } }
          user.reload
          expect(user.role).to eq('assistant')
        end
      end

      context 'when current user is not an assistant' do
        before do
          allow(controller).to receive(:current_user).and_return(user)
        end

        it 'does not permit role attribute' do
          # Test that role cannot be updated by regular users
          original_role = user.role
          patch :update, params: { id: user.id, user: { role: 'assistant' } }
          user.reload
          expect(user.role).to eq(original_role)
        end
      end
    end
  end
end 