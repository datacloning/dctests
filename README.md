# Testing the functionality of DC related packages

MCMC runs are time consuming, therefore the `\dontrun{}` construct
is used in help file examples.

Testing functionality utilizes the `run.dontrun = TRUE` argument of
the `example` function to do just that outside of regular
`R CMD check`.
