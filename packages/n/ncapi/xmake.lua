package("ncapi")
    set_homepage("https://github.com/nexcaise/ncapi")
    set_description("The ncapi package")
    set_kind("library")

    add_urls("https://github.com/nexcaise/ncapi/archive/refs/tags/$(version).tar.gz")
    add_versions("0.0.1", "a83f47eb385382c1fd3cd46d860cd7437017797f77f180abb147a3e8a9ba1a81")

    add_deps("cmake")

    on_load(function (package)
        package:set("cmake.build_shared", true)
        package:add("includedirs", "include")
        package:add("linkdirs", "libs/arm64-v8a")
        package:add("links", "GlossHook", "nise", "log")
    end)

    on_install(function (package)
        import("package.tools.cmake").install(package, {})
    end)