class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  rescue_from Mongoid::Errors::DocumentNotFound do |error|
    render json: {message: 'Resource not found'}, status: :not_found
  end

  rescue_from Mongoid::Errors::Validations do |error|
    render json: {message: error.message}, status: :bad_request
  end
end
