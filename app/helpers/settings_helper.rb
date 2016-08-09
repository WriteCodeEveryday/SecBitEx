module SettingsHelper
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
	
	def getToken(key)
		@config = getConfig
		if @config && @config == 'env'
			@env = ENV[key]

			if @env
				return @env
			end
			
			return ""
		elsif @config && @config == 'db'
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