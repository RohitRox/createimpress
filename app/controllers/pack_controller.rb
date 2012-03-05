class PackController < ApplicationController

  layout :resolve_layout

  def index
    render :text => "Fuck Im running"
    # respond_to do |format|
    #   format.html # index.html.erb
    # end
  end

  def create
    @pack = params[:pack]
  end

  def show_impress
        respond_to do |format|
      format.html # index.html.erb
    end
  end

   private

      def resolve_layout
        case action_name
        when "create"
          "impress"
        else
          "application"
        end
    end

end

