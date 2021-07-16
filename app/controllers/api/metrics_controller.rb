class Api::MetricsController < ApplicationController

    def bogosort
        @count = 0
        arr = []
        arr_json = []
        arr = Array.new(params[:n].to_i) { rand(1...100) }
        t1 = Time.now
        arr = bogo_sort(arr)
        t2 = Time.now
        delta = t2 - t1
        arr_json << arr.length()
        arr_json << @count
        arr_json << delta
        render json: arr_json
    end
    
    private
      def in_order?(arr)
        @count += 1
        (0..arr.length()-2).none? { |i| arr[i] > arr[i+1] }
      end
      
      def bogo_sort(arr)
        copy = arr.dup
        copy.shuffle! until in_order?(copy)
        copy
      end
end