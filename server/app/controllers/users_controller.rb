class UsersController < ApplicationController
  def sign_in
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      user.update(token: User.generate_token) unless user.token?
      render json: user
    else
      render json: { errors: [ 'ユーザ名またはパスワードが違います' ] }, status: 401
    end
  end
end
