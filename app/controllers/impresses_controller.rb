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
      require 'zip/zip'
      require 'zip/zipfilesystem'

     file_name = "pack_impress.zip"
      t = Tempfile.new("my-temp-filename-#{Time.now}")
      Zip::ZipOutputStream.open(t.path) do |z|

          z.put_next_entry('impress.js')
          z.print IO.read(Rails.root + "db/fixtures/impress.js")

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
end

