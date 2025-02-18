function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "waggon", "deutschland", "germany", "UIC", "gueterwagen", "db" },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },

        params = {
			{
				key = "sahlmmps_fake",
				name = _("Fake_sahlmmps_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_sahlmmps_desc"),
				defaultIndex = 0,
			},
        },
	},
	options = {
	},

	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["706_fake.mdl"] = true,
			["706_dbag_fake.mdl"] = true,
			["713_dbag_fake.mdl"] = true,
			["721_fake.mdl"] = true,
			["721_hbr_fake.mdl"] = true,
			["721_dbag_fake.mdl"] = true,
			["721_dbag2_fake.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/sahlmmps_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["sahlmmps_fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end

		addModifier( "loadModel", metadataHandler )
	end
	}
end
