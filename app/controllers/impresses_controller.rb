class ImpressesController < ApplicationController
  # GET /impresses
  # GET /impresses.json

  def create_impress
 

  end

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

  # GET /impresses/new
  # GET /impresses/new.json
  def new
    @impress = Impress.new

    respond_to do |format|
      format.html # new.html.erb
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
      base_impress = IO.read(Rails.root + "db/fixtures/impress.js")
      require 'zip/zip'
      require 'zip/zipfilesystem'

      t = Tempfile.new("bundle")
      # Give the path of the temp file to the zip outputstream, it won't try to open it as an archive.
      x = Zip::ZipOutputStream.open(t.path) 
      x.put_next_entry("impress.js")
      x.print IO.read("db/fixtures/impress.js")

      # End of the block  automatically closes the file.
      # Send it using the right mime type, with a download window and some nice file name.
      send_file t.path, :type => 'application/zip', :disposition => 'attachment', :filename => "some-brilliant-file-name.zip"
      # The temp file will be deleted some time...
      t.close
      #render :text=>base_impress.to_s
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
end

