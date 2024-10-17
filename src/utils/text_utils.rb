class TextUtils
    def self.wrap_text(font, text, max_width)
        words = text.split(' ')
        lines = []
        current_line = ""
      
        words.each do |word|
          if font.text_width(current_line + word) < max_width
            current_line += "#{word} "
          else
            lines << current_line.strip  
            current_line = "#{word} "     
          end
        end
      
        lines << current_line.strip unless current_line.strip.empty?
        lines
    end
end