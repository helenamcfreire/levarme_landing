class GcmController < ApplicationController

  def register
    gcm_api_key = 'AIzaSyBv8OPZapshhVIQWtowJcKGp_VV0waMv94'
    gcm = GCM.new(gcm_api_key)
    registration_ids = [params[:regId]]
    gcm.send_notification(registration_ids)
  end

end