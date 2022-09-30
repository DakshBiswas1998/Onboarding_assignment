module HomePage
    class << self
      SEARCH_BUTTON =  [:css, "input[name='q']"].freeze
      CLOSE_POP_UP = [:css, 'button._2doB4z'].freeze
      SEARCH_BOX = [:css, "input[name='q']"].freeze
      SEARCH_RESULTS = [:css, 'div._4rR01T'].freeze
      SEARCH_BTN = [:css, "button[type='submit']"].freeze
  
      def get_element(element)
        how = element.first
        what = element.last
        $driver.find_element(how, what)
      end
  
      def get_elements(elements)
        how = elements.first
        what = elements.last
        $driver.find_elements(how, what)
      end
  
      def close_pop_up
        pop_up_close_btn = get_element(CLOSE_POP_UP)
        pop_up_close_btn.click
      end
  
      def visit_home
        $driver.get "https://Flipkart.com"
      end

      def enter_product(product_name)
        search_box = get_element(SEARCH_BOX)
        search_box.send_keys(product_name)
      end
  
      def click_search_btn
        get_element(SEARCH_BTN).click
      end
  
      def is_search_results_shown
        @product_titles = []
        search_results = get_elements(SEARCH_RESULTS)
        search_results.size > 0 ? true : false
      end
  
    end
  end