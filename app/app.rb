class Padrinojasmine < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register CompassInitializer

  
  ## 
  # Assets
  #  
  register CompassInitializer
  register Padrino::Sprockets   
  register Padrino::AssetHelpers

  set :stylesheets_folder, :css
  set :javascripts_folder, :js
  
  assets do    
    digest false  
    handle_stylesheets false  
    assets_folder '/public'
    append_path   '../assets/js'  
    append_path   '../spec/javascripts'
    append_path   '../vendor/assets/js'   
  end  
end
