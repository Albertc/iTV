# frozen_string_literal: true

class Episode < Content
  belongs_to :season, foreign_key: 'parent_id'

  scope :ordered, ->{order(:number)}
end
