package("ncapi")
    set_homepage("https://github.com/nexcaise/ncapi")
    set_description("The ncapi package")
    set_kind("library")
    add_urls("https://github.com/nexcaise/ncapi/archive/refs/tags/$(version).tar.gz")
    
    
    add_versions("0.0.2-beta.3", "e3e0b3b48316e197cdaa0c1ab60763887309c19b18c92f24ef0959a22c096c27")

    add_deps("cmake")
    add_configs("shared", {description = "Build shared library", default = false, type = "boolean"})

    on_load(function (package)
        package:set("cmake.build_shared", package:config("shared"))
        package:add("includedirs", "include")
        package:add("linkdirs", "libs/arm64-v8a")
        package:add("links", "GlossHook", "nise", "log")
    end)

    on_install(function (package)
        import("package.tools.cmake").install(package, {})
    end)