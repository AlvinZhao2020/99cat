    # t.date "birth_date", null: false
    # t.string "name", null: false
    # t.string "color", null: false
    # t.string "sex", null: false
    # t.text "description"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    CAT_COLORS = %W(BLACK WHITE ORANGE BROWN).freeze
    validates :color, inclusion: CAT_COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :name, :color, :sex, presence: true
    def age
        time_ago_in_words(birth_date)
    end

    has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest
    dependent: :destroy
end
