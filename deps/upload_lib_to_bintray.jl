# This script lets us load the compiled .so file to bintray

using HTTPClient

function load_apikey()
	fin  = open("apikey.txt")
	lines = readlines(fin)
	close(fin)
	apikey = lines[1]
	@assert(length(apikey) == 40)
	apikey
end
const APIKEY = load_apikey()::ASCIIString
const USERNAME = "tawheeler"
const DESTPATH = "generic/libsmilejl/libsmilejl_unix_x64_0_1_0/generic/"

curpath = dirname(@__FILE__() )
downloads = curpath*"/downloads" 
@assert(isdir(downloads))

srcfile = downloads *"/libsmilejl.so"
println("uploading ", srcfile)
println("username: ", USERNAME)
println("destpath: ", DESTPATH)

run(`curl -T $srcfile -u$(USERNAME):$(APIKEY) https://api.bintray.com/content/$(USERNAME)/$DESTPATH`)

println("\tTry running build.jl to make sure the file can be downloaded")
println("done")