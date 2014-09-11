require_relative 'base_page'

class Movies < BasePage
  page_url($base_url+'/movies')

  div(:movie_list, :id => 'movies_accordion') #dont hide 'movies' in base page
  h3(:first_movie, :id => 'movie_heading_1')
  link(:first_showtime, :id => 'movie_showtimes_1')
  div(:theater_list, :class => 'movie_now_playing')
  div(:synopsis, :class => 'movie_synopsis')
  div(:running_time, :class => 'movie_info', :text => /Running time/)
  div(:rating, :class => 'movie_info', :text => /Rating/)

  def view_first_movie_showtimes
    self.first_movie_element.click
    self.first_showtime
  end

  def view_first_movie_details
    self.first_movie_element.click
  end

  def verify_presence(detail)
    detail_field = detail.gsub(' ','_')
    self.send("#{detail_field}_element").when_present(1)
  end
end