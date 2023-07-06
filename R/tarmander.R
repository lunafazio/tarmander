#' A microutil for switching between `targets` scripts
#'
#' You can call the function object to print the current active project or call
#' the actual function to select/change projects.
#'
#' @examples
#' tarmander::tarmander()
#' @export
tarmander <- structure(\(){
  subprojs <- list.files(".", pattern = "^_targets.R$",
                         full.names = TRUE, recursive = TRUE)
  subprojs <- subprojs[which(!subprojs == "./_targets.R")]
  subdirs <- sub("\\.R", "", subprojs)
  if(length(subdirs)==0) {
    warning("No _targets.R found in subdirectories\n")
    return(invisible(NULL))
  }
  choice <- utils::menu(dirname(subdirs), title = "Select active project:")
  targets::tar_config_set(script = subprojs[choice], store = subdirs[choice])
}, class = "tarmander")

#' @method print tarmander
#' @export
print.tarmander <- function(x, ...) {
  subproj <- dirname(targets::tar_config_get("script"))
  if(identical(subproj, ".")) {
    cat("No subproject set! Call .tarmander() first\n")
  } else {
    cat("Currently working at", subproj, "\n")
  }
}