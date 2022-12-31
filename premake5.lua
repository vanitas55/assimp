project "assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir("bin/" ..outputdir.. "/%{prj.name}")
    objdir("bin-int/" ..outputdir.. "/%{prj.name}")

    files
    {
        "include/**.h",
        "include/**.h.in",
        "include/**.inl",
        "code/**.h",
        "code/**.cpp"
    }

    removefiles {
        "code/AssetLib/IFC/IFCReaderGen_4.cpp",
        "code/AssetLib/IFC/IFCReaderGen_4.h",
        "code/Common/Version.cpp"
    }

    includedirs
    {
        "include",
        "code",
        "contrib",
        "contrib/pugixml/src",
        "contrib/openddlparser/include",
        "contrib/rapidjson/include",
        "contrib/unzip",
        "contrib/zlib",
        "%{prj.location}"
    }

    defines
    {
        "WIN32",
        "_WINDOWS",
        "ASSIMP_BUILD_DLL_EXPORT",
        "ASSIMP_BUILD_NO_M3D_IMPORTER",
        "ASSIMP_BUILD_NO_M3D_EXPORTER",
        "WIN32_LEAN_AND_MEAN",
        "UNICODE",
        "_UNICODE",
        "ASSIMP_BUILD_NO_OWN_ZLIB",
        "ASSIMP_BUILD_NO_C4D_IMPORTER",
        "MINIZ_USE_UNALIGNED_LOADS_AND_STORES=0",
        "ASSIMP_IMPORTER_GLTF_USE_OPEN3DGC=1",
        "RAPIDJSON_HAS_STDSTRING=1",
        "RAPIDJSON_NOMEMBERITERATORCLASS",
        "_SCL_SECURE_NO_WARNINGS",
        "_CRT_SECURE_NO_WARNINGS",
        "OPENDDLPARSER_BUILD",
        "assimp_EXPORTS"
    }

    filter "system:windows"
        systemversion "latest"
    
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"
        defines
        {
           "_DEBUG"
        }

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        defines
        {
            "_RELEASE"
        }