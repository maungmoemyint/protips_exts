class Tip < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy

  has_and_belongs_to_many :users

  validates :title, presence: true,
                    length: { maximum: 100 },
                    uniqueness: {case_sensitive: false}
  validates :body,  presence: true,
                    uniqueness: {case_sensitive: false}

  scope :most_recent,          -> { order(updated_at: :desc).limit(4) }
  scope :title_contains,       ->(item) { where('title LIKE ?', "%#{item}%".downcase ) }

  scope :body_contains,        ->(item) { where('body LIKE ?', "%#{item}%".downcase ) }

  scope :search,               ->(search_term) { title_contains(search_term).or(body_contains(search_term)) }

  paginates_per 8

end
