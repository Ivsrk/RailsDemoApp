class Article < ActiveRecord::Base
    belongs_to :user
    has_many :article_categories
    has_many :categories,through: :article_categories
    validates :title,presence:true,length:{minimum:2}
   #validates :description, length:{in: 3..100}

    before_save :calculate_word_count

    def calculate_word_count
        
        self.word_count=description.split.size unless description.nil?
    end

end
