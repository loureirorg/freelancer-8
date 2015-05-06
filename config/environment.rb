# Load the Rails application.
require File.expand_path('../application', __FILE__)

ENV['FACEBOOK_KEY'] = "334916903284528"
ENV['FACEBOOK_SECRET'] = "a636b51563656666317ab68f34863746"
ENV['GOOGLE_CLIENT_ID'] = "193793790258-072otkihajks4ojdsgejne54uvec86r4.apps.googleusercontent.com"
ENV['GOOGLE_CLIENT_SECRET'] = "lRf1wT1wvHQ0NtsjlDrUtEEm"

# ENV['FACEBOOK_KEY'] = "700728386703376"
# ENV['FACEBOOK_SECRET'] = "549c3b91ada42c091b11300eaf0265d2"

# Initialize the Rails application.
Rails.application.initialize!
