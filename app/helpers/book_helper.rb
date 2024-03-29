# frozen_string_literal: true

module BookHelper
  def formatted_genres
    Book.genres.map { |key, _value| key }
  end

  def format_genre(genre)
    genre.titleize
  end
end
