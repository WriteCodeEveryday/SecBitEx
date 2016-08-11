module SettingsHelper
	@CONFIG_PROVIDER = nil

	def getConfig
		@env = ENV['CONFIG_PROVIDER']
		@db = Setting.where({:key => 'CONFIG_PROVIDER'}).first

		if @env
			return @env
		elsif @db
			return @db
		end

		return ""
	end
	
	def getTokenNumber(key)
		getToken(key).to_f
	end

	def getTokenBoolean(key)
		getToken(key) == "true"
	end
	
	def getToken(key)
		@CONFIG_PROVIDER = getConfig if !@CONFIG_PROVIDER
		
		if @CONFIG_PROVIDER && @CONFIG_PROVIDER == 'env'
			@env = ENV[key]

			if @env
				return @env
			end
			
			return ""
		elsif @CONFIG_PROVIDER && @CONFIG_PROVIDER == 'db'
			@db = Setting.where({:key => key}).first

			if @db
				return @db.value
			end

			return ""
		else
			return ""
		end
	end
end