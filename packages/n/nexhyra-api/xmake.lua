package("nexhyra-api")
    set_homepage("https://github.com/nexcaise/nexhyra-api")
    set_description("The nexhyra api package")
    set_kind("library")
    add_urls("https://github.com/nexcaise/nexhyra-api/archive/refs/tags/$(version).tar.gz",
             "https://github.com/nexcaise/nexhyra-api.git")

    add_versions("0.0.1-alpha.4", "37cf8d638eff7a13f87fc521cf4fa48e6418f97fb857936e989f68d57310ca14")
    add_versions("0.0.1-alpha.3", "5cb90a88fd4085405e1d6cb081d131c45713124437f5ba3fa70db5ccf3f2b260")
    add_versions("0.0.1-alpha.2", "4bc6c0d8ee934d3756e6e50a67abfd6a257edd459ac87fdb33b4f873e32da13c")
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
