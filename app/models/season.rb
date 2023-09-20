class Season < ApplicationRecord
    has_and_belongs_to_many :matches, join_table: "matches_seasons", foreign_key: "matches_id", dependent: :destroy
end
