require "spec_helper"

module RailsMarketplace
  describe CatalogController do
    describe "routing" do

      it "routes to #catalog" do
        get("/catalog/books").should route_to("catalog#category_products", :name => "books")
      end

      it "routes to #product" do
        get("/product/bible").should route_to("catalog#product_detail", :title => "bible")
      end

      it "routes to #add_to_cart" do
        post("/cart/add").should route_to("catalog#add_to_cart")
      end

      it "routes to #cart" do
        get("/cart").should route_to("catalog#cart")
      end

      it "routes to #cart_update" do
        put("/cart/update").should route_to("catalog#cart_update")
      end

      it "routes to #cart_delete" do
        delete("/cart/delete/1").should route_to("catalog#cart_delete", :product_id => "1")
      end

      it "routes to #checkout" do
        get("/checkout").should route_to("catalog#checkout")
      end

      it "routes to #charge" do
        post("/charge").should route_to("catalog#charge")
      end

      it "routes to #checkout_success" do
        get("/checkout/success").should route_to("catalog#checkout_success")
      end
    end
  end
end
