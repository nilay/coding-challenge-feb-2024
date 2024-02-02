# frozen_string_literal: true

module Crud
  extend ActiveSupport::Concern
  DEFAULT_RECORD_PER_PAGE = 10

  included do
    before_action :set_scope
    before_action :set_resource, only: %i[show update destroy]
  end

  def index
    collections = collection
    render_200(collections.as_api_response(index_template).map {|item| { attributes: item }})
  end

  def show
    render_200({ attributes: @resource.as_api_response(show_template) })
  end

  def create
    resource = create_resource.new(resource_params)
    if resource.save
      render_201(
        message: "#{resource_name} has been created successfully",
        data: resource.as_api_response(show_template)
      )
    else
      render_422 errors: resource.errors
    end
  end

  def update
    if @resource.update(resource_params)
      render_201(
        message: "#{resource_name} has been updated successfully",
        data: @resource.as_api_response(show_template)
      )
    else
      render_422 errors: @resource.errors
    end
  end

  def destroy
    if @resource.destroy
      render_204
    else
      render_422 errors: @resource.errors
    end
  end

  protected

  # can be overwritten in controller to define own create resource
  def create_resource
    @scope
  end

  def set_scope
    @scope ||= send(controller_name + '_scope')
  end

  def show_template
    :show
  end

  def index_template
    :index
  end

  private

  def collection
    @collection ||= build_collection
  end

  def resource_name
    controller_name.singularize
  end

  def collection_name
    resource_name.to_s.pluralize.to_sym
  end

  def resource_params
    send("#{resource_name}_params")
  end

  def set_resource
    @resource ||= @scope.find(params[:id])
  end

  def resource_params
    send("#{resource_name}_params")
  end

  def build_collection(object = nil)
    result = (object || @scope)
    result = result.ransack(search_params).result           if search_params.present?
    result = result.page(params[:page] || 1).per(params[:limit] || DEFAULT_RECORD_PER_PAGE) if params[:limit] != '-1'
    result = result.order(collection_order)                 if collection_order.present?
    result
  end

  def collection_order
    { created_at: :desc }
  end

  def search_params
    params[:q]
  end

  def pagination(collection)
    return {} if params[:limit] == '-1'
    {
      current_page: collection&.current_page || 1,
      next_page: collection&.next_page,
      previous_page: collection&.prev_page,
      total_pages: collection&.total_pages || 1,
      per_page: collection&.limit_value,
      total_entries: collection&.total_count
    }
  end
end
