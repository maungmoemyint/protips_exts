class Tip < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy

  has_and_belongs_to_many :users

  validates :title, presence: true,
                    length: { maximum: 100 }
  validates :body,  presence: true

  scope :most_recent,          -> { order(updated_at: :desc).limit(4) }
  scope :title_contains,       ->(item) { where('title LIKE ?', "%#{item}%") }
  scope :body_contains,        ->(item) { where('body LIKE ?', "%#{item}%") }
  scope :search,               ->(search_term) { title_contains((search_term).upcase).or(body_contains((search_term).downcase)) }

  paginates_per 8

end
