class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  http_basic_authenticate_with name: "user", password: "qwerty1234", except: [:index, :show]

  # GET /products or /products.json
  def index
    @products = Product.all
    #@products = Product.all.order('productName').paginate(page: params[:page]) 
    @search = params["search"]

    if @search.present?
      # Search only        
      @name = @search["product"]
      @products = Product.where("productName LIKE ?", "%#{@name}%").order('productName').paginate(page: params[:page])  
    else
       # all products
       @products = Product.all.order('productName').paginate(page: params[:page])  
    end
  end

  # GET /productss/1 or /productss/1.json
  def show
  end

  # GET /productss/new
  def new
    @product = Product.new
  end

  # GET /productss/1/edit
  def edit
  end

  # POST /productss or /productss.json
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

  # PATCH/PUT /productss/1 or /productss/1.json
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

  # DELETE /productss/1 or /productss/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
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
