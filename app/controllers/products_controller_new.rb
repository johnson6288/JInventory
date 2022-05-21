class ProductsController < ApplicationController
  before_action :set_product, only: %
  i[ show edit update destroy ]
  

  # GET /products or /products.json
  def index
    @products = Product.all
    # @search = params["search"]
    # @filter = params[:platforms]
    # @filter2 = params[:types]
    # # @platforms = Platform.distinct.pluck(:platformName)
    # @platforms = Platform.distinct.pluck(:platformName)
    # @types = Type.distinct.pluck(:typeName)
    

    # if @search.present? || @filter.present? || @filter2.present?
    #   if @search.present? && @filter.present?
    #     # Search and filter 
    #     @name = @search["product"]
    #     session[:platforms] = @filter
    #     session[:types] = @filter2
    #     #@products = Product.joins(:platform, :type).where("platforms.platformName in (?)", @filter).where("platform_id LIKE ? or productName LIKE ?", "%#{@name}%", "%#{@name}%").order('productName').paginate(page: params[:page], per_page: 3)
    #     @products = Product.where("platform_id in (?)", @filter).where("platform_id LIKE ? or productName LIKE ?", "%#{@name}%", "%#{@name}%").order('productName').paginate(page: params[:page], per_page: 3)      
    #   elsif @search.present?
    #     # Search only        
    #     @name = @search["product"]
    #     session[:platforms] = @filter
    #     @products = Product.where("productName LIKE ? or comments LIKE ?", "%#{@name}%", "%#{@name}%").order('productName').paginate(page: params[:page], per_page: 3)  
    #   else
    #     # Filter only
    #     session[:platforms] = @filter
    #     @products = Product.where("platform_id in (?)", @filter).order('productName').paginate(page: params[:page], per_page: 3)   
    #   end
    # else
    #   # all products
    #   session[:platforms] = nil
    #   @products = Product.all.order('productName').paginate(page: params[:page], per_page: 3)  
    # end

    #@products = Product.all
    # if params[:platform].blank?
    #   @products = Product.all.order("created_at DESC")
    # else
    #   @platform_id = Platform.find_by(name: params[:platform]).id
    #   @products = Product.where(platform_id: @category_id_).order("created_at DESC")
    # end
#     @search = params["search"]
#     if @search.present?
#       @product = @search["product"]
# #      @products = Product.where("productName LIKE ?", "%#{@name}%")
#       @products = Product.where("productName LIKE ?", "%#{@product}%").paginate(page: params[:page], per_page: 10)
#     else
#       @products = Product.paginate(page: params[:page], per_page: 10)  
#     end
#    @products = Product.paginate(page: params[:page], per_page: 10) 
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:productName, :platform_id, :status_id, :type_id, :occasion_id, :comments)
    end
end
