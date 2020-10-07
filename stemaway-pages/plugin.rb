# frozen_string_literal: true

# name: new-page
# about: Demonstrate adding a new static page with a Discourse plugin
# version: 0.1
# authors: James Kiesel (gdpelican)
register_asset "stylesheets/stemaway-pages-styles.scss"
after_initialize do
  Discourse::Application.routes.prepend do
    get "/pages/about" => "static#about"
  end
  Discourse::Application.routes.prepend do
    get "/pages/company" => "static#company"
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
