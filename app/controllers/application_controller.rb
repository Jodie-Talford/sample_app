class ApplicationController < ActionController::Base

  def hello
    render html: "hello, world!" #will change later
  end
end
