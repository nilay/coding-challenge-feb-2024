#frozen_string_literal: true

class V1::AccountsController < ApplicationController
  include Crud

  protected
  def accounts_scope 
    Account.all
  end
end
