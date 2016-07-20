class FrontsController < ApplicationController
  before_action :done_responsibilities ,only: [:index]
  before_action :select_responsibilities, only: [:index]
  require 'date'

  def index
  end


  def select_responsibilities
    @responsibilities_pending = Responsibility.where({done: false})
  end

  private
    def done_responsibilities
      if Responsibility.first
        resp = Responsibility.all
        resp.each do |r|
          if r.date_of_action < Date.today
            r.done = true
            r.save
          else
            r.done = false
            r.save
          end
        end
      end
     end
end