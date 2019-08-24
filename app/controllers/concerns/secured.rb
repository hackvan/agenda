module Secured
  def authenticate_user!
    headers = request.headers
    if headers['ApiKeyAuth'].present?
      token = headers['ApiKeyAuth']
      p token
      p User.find_by_api_key(token)
      if @user = User.find_by_api_key(token)
        p @user
        return 
      end
    end

    render json: { 
      status: 401,
      errors: [
        { detail: "No autorizado" }
      ]
    }, status: :unauthorized
  end
end