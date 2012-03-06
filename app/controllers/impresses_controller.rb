class ImpressesController < ApplicationController

layout :resolve_layout

 def index
    @impresses = Impress.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @impresses }
    end
  end

  # GET /impresses/1
  # GET /impresses/1.json
  def show
    @impress = Impress.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @impress }
    end
  end

  # GET /impresses/1/edit
  def edit
    @impress = Impress.find(params[:id])
  end

  # POST /impresses
  # POST /impresses.json
  def create
    if params[:title] == ""
      file_name = "pack_impress_#{Time.now}.zip"
    else
      file_name = params[:title].to_s+".zip"
    end
      require 'zip/zip'
      require 'zip/zipfilesystem'
       head = Boilerplate.first.head
       foot = Boilerplate.first.foot
      if params[:save_or_not] == '1'

          @i_pack = Impress.new(:title=>params[:title], :slide_pack=>params[:pack]);
          @i_pack.save

          t = Tempfile.new("my-temp-filename-#{Time.now}")
          Zip::ZipOutputStream.open(t.path) do |z|
              z.put_next_entry('impress.js')
              z.print IO.read(Rails.root + "db/fixtures/impress.js")
              z.put_next_entry('index.html')
              z.write head+params[:pack]+foot
          end

      else

          t = Tempfile.new("my-temp-filename-#{Time.now}")
          Zip::ZipOutputStream.open(t.path) do |z|

              z.put_next_entry('impress.js')
              z.print IO.read(Rails.root + "db/fixtures/impress.js")
              z.put_next_entry('index.html')
              z.write head+params[:pack]+foot
          end
      end
          send_file t.path, :type => 'application/zip',
                                 :disposition => 'attachment',
                                 :filename => file_name
          t.close
  end

  # PUT /impresses/1
  # PUT /impresses/1.json
  def update
    @impress = Impress.find(params[:id])

    respond_to do |format|
      if @impress.update_attributes(params[:impress])
        format.html { redirect_to @impress, notice: 'Impress was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @impress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impresses/1
  # DELETE /impresses/1.json
  def destroy
    @impress = Impress.find(params[:id])
    @impress.destroy

    respond_to do |format|
      format.html { redirect_to impresses_url }
      format.json { head :ok }
    end
  end

    private

      def resolve_layout
        case action_name
        when "show"
          "impress"
        else
          "application"
        end
    end

end

