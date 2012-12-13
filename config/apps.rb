##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  set :session_secret, '992dc6d016c5421a95bc95b71a1f7b3c55817653e1d8b2d1010599ae249367dd'
end

# Mounts the core application for this project
Padrino.mount("Padrinojasmine").to('/')
