class DebugLog
    COLORS = {
      info: "\e[34m",    
      warning: "\e[33m", 
      error: "\e[31m",
      disclaimer: "\e[36m",
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

    def self.disclaimer
        log("================================================================================", :disclaimer)
        log("Disclaimer: Debug log is activated. To deactivate it, change it in src/config.rb", :disclaimer)
        log("                You will gain some extra ability and stats.                     ", :disclaimer)
        log("================================================================================", :disclaimer)
    end
  
    private
  
    def self.log(message, level)
        timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    
        if DEBUG_MODE == true
            puts "#{COLORS[level]}[#{timestamp}] #{message}#{COLORS[:reset]}"
        end
    end
  end
  