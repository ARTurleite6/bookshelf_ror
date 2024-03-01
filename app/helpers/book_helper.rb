module BookHelper
  def formatted_genres
    Book.genres.map { |key, _value| key }
  end

  def format_genre(genre)
    genre.split('_').map(&:capitalize).join(' ')
  end
end
