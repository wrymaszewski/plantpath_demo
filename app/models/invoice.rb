class Invoice < ApplicationRecord
	mount_uploader :file, FileUploader 

	def self.to_csv
      attributes = %W{cat_no supplier category_1 category_2 name price date comments}
      CSV.generate(headers: true) do |csv|
        csv << attributes

        all.each do |r|
          csv << attributes.map {|attr| r.send(attr)}
        end
      end  
  end

  def self.unique_categories
    cat_1=[]
    uq = {}
    all.each do |r|
      cat_1 << r.category_1
    end
    cat_1 = cat_1.uniq
    cat_1.each do |c1|
      array = []
      all.each do |c2|
        if c2.category_1 == c1
          array << c2.category_2
        end
        array = array.uniq
        hash_ = Hash.new
        hash_[c1] = array
        uq.merge!(hash_)
      end
    end
    return uq
  end

  def self.summary (category1, category2, year)
    prices_all = []
    prices = []
    all.each do |r|
      if r.category_1 == category1 and r.date.year == year
        if r.category_2 == category2
          prices << r.price
        end
        prices_all << r.price
     end
    end
    sum = 0
    sum_all = 0
    prices.each do |p|
      if p == nil
        p = 0.0
      end
      sum = sum + p
    end
    prices_all.each do |p|
      if p == nil
        p = 0.0
      end
      sum_all = sum_all + p
    end
    return [sum_all.round(2), sum.round(2)]
  end
end
