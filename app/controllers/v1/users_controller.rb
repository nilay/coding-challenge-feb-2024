# frozen_string_literal: true

class V1::UsersController < ApplicationController
  include Crud  # to perform basic crud operation

  def users_scope
    User.includes(:accounts)
  end
end
