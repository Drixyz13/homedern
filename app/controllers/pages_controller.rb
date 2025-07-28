class PagesController < ApplicationController
  def home
      @pod   = Product.find_by(name: "Homedern Pod")
     @temps  = Product.find_by(name: "Homedern Temps")
     @fridge = Product.find_by(name: "Homedern Fridge")
  end
end