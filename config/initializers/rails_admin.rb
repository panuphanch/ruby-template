RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.current_user_method { current_user }

  ## == CancanCan ==
  config.authorize_with :cancancan

  config.parent_controller = 'ApplicationController'

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
