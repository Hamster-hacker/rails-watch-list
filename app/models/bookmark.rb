class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list, message: "is already in this list" }


  # MOVIES = [" Wonder Woman 1984', 'The Shawshank Redemption', 'Titanic', 'created Ocean's Eight'"]
  # validates :movie_id, inclusion: {in: MOVIES}

end
