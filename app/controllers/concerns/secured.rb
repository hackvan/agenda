module Secured
  def authenticate_user!
    headers = request.headers
    if headers['ApiKeyAuth'].present?
      token = headers['ApiKeyAuth']
      return if (@user = User.find_by_api_key(token))
    end

    render json: {
      status: 401,
      errors: [
        { detail: 'No autorizado' }
      ]
    }, status: :unauthorized
  end
end
