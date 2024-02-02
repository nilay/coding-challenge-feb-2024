#frozen_string_literal: true

class V1::User::AccountsController < V1::AccountsController
  include Crud
  prepend_before_action :set_user

  def accounts_scope
    @user.accounts
  end

  private
  def set_user
    @user = User.find params[:user_id]
  end
end
