#    t.integer "cat_id", null: false
#     t.date "start_date", null: false
#     t.date "end_date", null: false
#     t.string "status", default: "pending", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["cat_id"], name: "index_cat_rental_requests_on_cat_id"

class CatRentalRequest < ApplicationRecord
    STATUS = %W(pending approved denied).freeze
    validates :cat_id, :start_date, :end_date, :status, null:false
    validates :status, inclusion: STATUS

    belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

    def overlapping_requests
        CatRentalRequest
        .where.not(id: self.id)
        .where(cat_id: cat_id)
        .where.not('start_date > :end_date OR end_date < :start_date',
                 start_date: start_date, end_date: end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where('status=\'approved\'' )
    end

    def overlapping_pending_requests
        overlapping_requests.where('status = \'pending\'')
    end
end
