package("nexhyra-api")
    set_homepage("https://github.com/nexcaise/nexhyra-api")
    set_description("The nexhyra api package")
    set_kind("library")
    add_urls("https://github.com/nexcaise/nexhyra-api/archive/refs/tags/$(version).tar.gz",
             "https://github.com/nexcaise/nexhyra-api.git")

    add_versions("0.0.1-alpha.1", "588e827f6ef719857118cb6ead8089e71cc0b1f0bd5e1de18b97dfe242dc39ed")

    add_deps("cmake")

    on_load(function (package)
        package:data_set("cmake.build_shared", true)
        package:add("includedirs", "include")
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
