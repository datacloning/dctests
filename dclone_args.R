library(dclone)
library(rjags)

Pairs <- list(
    c("coda.samples", "codaSamples"),
    c("jags.model", "jagsModel"),
    c("coda.samples", "parCodaSamples"),
    c("jags.model", "parJagsModel"),
    c("list.factories", "parListFactories"),
    c("list.modules", "parListModules"),
    c("load.module", "parLoadModule"),
    c("set.factory", "parSetFactory"),
    c("unload.module", "parUnloadModule"),
    c("rjags:::update.jags", "parUpdate"))

coda.samples(model, variable.names, n.iter, thin = 1, na.rm=TRUE, ...)
codaSamples(model, variable.names, n.iter, thin = 1, ...)
parCodaSamples(cl, model, variable.names, n.iter, thin = 1, ...)


for (Pair in Pairs) {
    cat("---", Pair, "\n\n")
    fs <- formals(Pair[1])
    fp <- formals(Pair[2])
    if ("cl" %in% names(fp))
        fp[["cl"]] <- NULL
    cat("checking number of args: ")
    cat(ifelse(length(fs)==length(fp), "OK", "ERROR"))
    cat("\n")
    cat("checking arg names, diff: ")
        print(setdiff(names(fs), names(fp)))
    cat("\n")
    cat("checking arg names, reverse diff: ")
        print(setdiff(names(fp), names(fs)))
    cat("\n")
    cat("checking order: ")
        cat(ifelse(all(names(fs)==names(fp)), "OK", "ERROR"))
    cat("\n")
    cat("checking values: ")
    z <- sapply(1:min(length(fs),length(fp)),
        function(i) identical(fs[[i]], fp[[i]]))
    cat(ifelse(all(z), "OK", "ERROR"))
    cat("\n\n\n")
}

