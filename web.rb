require 'sinatra/base'

module SlackSnackbot
  class Web < Sinatra::Base
    get '/' do
      'Yum Yum Yum'
    end
  end
end
