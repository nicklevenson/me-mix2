class WelcomeController < ApplicationController
  class WelcomeController < ApplicationController
    include WelcomeHelper
    def index
      @results = filter || []
    end
  end
end
