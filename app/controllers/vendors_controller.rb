class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all 
  end

  def show
    @projects = @vendor.projects.all
  end

  def new
    @vendor = Vendor.new 
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      flash[:success] = "Vendor Created!"
      redirect_to root_path 
    else
      flash[:danger] = "Please fill in all fields"
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
      if @vendor.update(vendor_params)
        flash[:success] = "Vendor Updated"
        redirect_to root_path 
      else
        render :edit
      end
  end

  def destroy
    @vendor.destroy 
    flash[:success] = "Deleted '#{@vendor.name}'"
    redirect_to root_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name)
  end
end
