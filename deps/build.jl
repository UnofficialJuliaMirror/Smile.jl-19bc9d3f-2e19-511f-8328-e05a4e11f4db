# using BinDeps
# @BinDeps.setup

# libsmilejl = library_dependency("libsmilejl.so", os=:Unix)

# provides(Binaries, 
# 	URI("http://dl.bintray.com/tawheeler/generic/libsmilejl.so/libsmilejl.so"), 
# 	libsmilejl, os=:Unix, unpacked_dir="libsmilejl")

# @BinDeps.install [:libsmilejl => :libsmilejl]