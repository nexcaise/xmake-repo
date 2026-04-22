package("ncapi")
    set_homepage("https://github.com/nexcaise/ncapi")
    set_description("The ncapi package")
    set_kind("library")
    add_urls("https://github.com/nexcaise/ncapi/archive/refs/tags/$(version).tar.gz")

    add_versions("0.0.1_beta", "f21567a94c5a18f368fc1b7dad4eb7c97aef9ce4a754db5d857121c550ddc952")

    add_deps("cmake")

    on_load(function (package)
        package:data_set("cmake.build_shared", true)
        package:add("includedirs", "include")
        package:add("linkdirs", "libs")
        package:add("links", "GlossHook", "nise", "log")
    end)

    on_install(function (package)
    import("package.tools.cmake").install(package, {})
    local instdir = package:installdir()
    if os.isdir("include") then
        os.cp("include/*", path.join(instdir, "include"))
    end
    if os.isdir("libs") then
        os.cp("libs/*", path.join(instdir, "libs"))
    end
end)
