# frozen_key_literal: true

class User < ApplicationRecord
  # ==== module inclusion ===
  include UserPresenter

  #=== associations ====
  has_many :accounts
end
