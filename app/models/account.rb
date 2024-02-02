# frozen_key_literal: true

class Account < ApplicationRecord
  # === module inclusion =====
  include AccountPresenter

  # ==== association ===
  belongs_to :user
end
