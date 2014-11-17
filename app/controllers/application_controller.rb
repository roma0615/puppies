class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def home
    unless cookies["mood"]
      cookies["mood"] = 5
    end
    
    if cookies['mood'].to_i > 6
      @image_url = "http://daylol.com/list/wp-content/uploads/2014/01/Happy-Puppy.jpg"
    else
      @image_url = "http://stuffpoint.com/puppies/image/42977-puppies-cute-puppies-wallpaper.jpg"
    end
  end
  
  def action
    
    if params['act'] == "feed"
      cookies['mood'] = cookies['mood'].to_i + 1
    end
    
    if params['act'] == "reset"
      cookies['mood'] = 5
    end
    
    if params['act'] == "scold"
      cookies['mood'] = cookies['mood'].to_i - 2
    end
    
    
    if cookies['mood'].to_i > 10
      cookies['mood'] = 10
    elsif cookies['mood'].to_i < 0
      cookies['mood'] = 0
    end
    
    
    
    
    redirect_to "/"
  end
end
