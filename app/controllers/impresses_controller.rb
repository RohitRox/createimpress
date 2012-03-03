class ImpressesController < ApplicationController
  # GET /impresses
  # GET /impresses.json
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
    @impress = Impress.new(params[:impress])

    respond_to do |format|
      if @impress.save
        format.html { redirect_to @impress, notice: 'Impress was successfully created.' }
        format.json { render json: @impress, status: :created, location: @impress }
      else
        format.html { render action: "new" }
        format.json { render json: @impress.errors, status: :unprocessable_entity }
      end
    end
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
