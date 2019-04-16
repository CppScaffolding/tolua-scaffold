-- scaffold geniefile for tolua

tolua_script = path.getabsolute(path.getdirectory(_SCRIPT))
tolua_root = path.join(tolua_script, "tolua")

tolua_includedirs = {
	path.join(tolua_script, "config"),
	tolua_root,
}

tolua_libdirs = {}
tolua_links = {}
tolua_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { tolua_includedirs }
	end,

	_add_defines = function()
		defines { tolua_defines }
	end,

	_add_libdirs = function()
		libdirs { tolua_libdirs }
	end,

	_add_external_links = function()
		links { tolua_links }
	end,

	_add_self_links = function()
		links { "tolua" }
	end,

	_create_projects = function()

project "tolua"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		tolua_includedirs,
	}

	defines {}

	files {
		path.join(tolua_script, "config", "**.h"),
		path.join(tolua_root, "**.h"),
		path.join(tolua_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
