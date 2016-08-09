module SettingsHelper
	def getConfig
		@env = ENV['CONFIG_PROVIDER']
		@db = Setting.where({:key => 'CONFIG_PROVIDER'}).first

		if @env
			return @env
		elsif @db
			return @db
		end

		return nil
	end
	
	def getToken(key)
		@config = getConfig
		if @config && @config == 'env'
			@env = ENV[key]

			if @env
				return @env
			end
			
			return nil
		elsif @config && @config == 'db'
			@db = Setting.where({:key => key}).first

			if @db
				return @db.value
			end
		else
			return nil
		end
	end
end