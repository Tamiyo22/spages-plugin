# frozen_string_literal: true

# name: custom stem-away pages
# about: A plugin for creating custom pages
# version: 0.4
# authors: James Kiesel (gdpelican), Keegan George (stalliondigital)
register_asset "stylesheets/stemaway-pages-styles.scss"
after_initialize do
  Discourse::Application.routes.prepend do
    get "/home" => "static#about"
    get "/company-portal" => "static#company"
  end

  class ::StaticController < ApplicationController
    before_action :set_view_path

    def about
      store_preloaded("categories", MultiJson.dump(Category.all))
    end

    def company
      store_preloaded("categories", MultiJson.dump(Category.all))
    end

    private

    def set_view_path
      append_view_path "plugins/stemaway-pages/views"
    end
  end
end
