# frozen_string_literal: true

module UserPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :name
    end

    api_accessible :index, extend: :base do |t|
      t.add :accounts, template: :base
      t.add lambda { |user|
        user.accounts.map {|account| account.balance}.sum
      }, as: :total_balance
    end

    api_accessible :show, extend: :index do |t|
    end
  end
end
