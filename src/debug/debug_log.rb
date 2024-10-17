class DebugLog
    COLORS = {
      info: "\e[34m",    
      warning: "\e[33m", 
      error: "\e[31m",   
      reset: "\e[0m"    
    }
  
    def self.info(message)
      log(message, :info)
    end
  
    def self.warning(message)
      log(message, :warning)
    end
  
    def self.error(message)
      log(message, :error)
    end
  
    private
  
    def self.log(message, level)
        timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    
        puts "#{COLORS[level]}[#{timestamp}] #{message}#{COLORS[:reset]}"
      
    end
  end
  