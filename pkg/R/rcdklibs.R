.packageName <- "rcdklibs"

require(rJava, quietly=TRUE)

.First.lib <- function(lib, pkg) {
    dlp<-Sys.getenv("DYLD_LIBRARY_PATH")
    if (dlp!="") { # for Mac OS X we need to remove X11 from lib-path
        Sys.setenv("DYLD_LIBRARY_PATH"=sub("/usr/X11R6/lib","",dlp))
    }

    jar.cdk <- paste(lib,pkg,"cont","cdk.jar",sep=.Platform$file.sep)
    ##jar.jmol <- paste(lib,pkg,"cont","Jmol.jar",sep=.Platform$file.sep)
    ##jar.jcp <- paste(lib,pkg,"cont","cdk-jchempaint.jar",sep=.Platform$file.sep)        
    .jinit(classpath=c(jar.cdk))
}
    

