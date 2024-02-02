# frozen_string_literal: true

module Renderer
  extend ActiveSupport::Concern

  def render_200(data) = render(json: data, status: :ok)

  # when new item is created
  def render_201(message: 'Item was created successfully',
                 data: {}) render json: { message:, data: }, status: :created
  end

  def render_204(message: 'Item was updated successfully', data: {}) = render(json: { message:, data: }, status: 204)

  # 400: Validation Error
  def render_400(message: 'Validation errors in your request',
                 errors: []) render json: { message:, errors: }, status: 400
  end

  # Unauthorized
  def render_401(message: 'Authentication credentials were missing or incorrect')
    render json: { message: },
           status: 401
  end

  # Forbidden
  def render_403(message: 'The request is understood, but it has been refused or access is not allowed')
    render json: { message: },
           status: 403
  end

  def render_404(message: 'The item does not exist') = render(json: { message: }, status: 404)

  # not acceptable
  def render_406(message: 'Not Acceptable') = render(json: { message: }, status: 406)

  # Unprocessable entity
  def render_422(message: 'Action could not be processed properly due to invalid data provided.',
                 errors: []) render json: { message:, errors: }, status: 422
  end

  def render_500(message: 'Something is broken') = render(json: { message: }, status: 500)
end
