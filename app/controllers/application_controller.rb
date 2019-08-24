class ApplicationController < ActionController::API
  rescue_from Exception do |e|
    render json: { 
      status: 500,
      errors: [ 
        { detail: e.message }
      ]
    }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { 
      status: 422,
      errors: [
        { detail: e.message }
      ]
    }, status: :unprocessable_entity
  end

end
