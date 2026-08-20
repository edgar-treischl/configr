#' Create a manifest file from specified folders
#'
#' @param folders Folder with config files to include in the manifest.
#' @param output Output file name for the manifest.
#'
#' @returns A JSON file containing a sorted list of files from the specified folders.
#' @export
#'
create_manifest <- function(
    folders = c("ansible", "cicd","docker",  "gitlab", "makefiles", "python", "r", "shell"),
    output = "manifest.json"
) {
  files <- unlist(lapply(folders, function(folder) {
    list.files(folder, recursive = TRUE, full.names = TRUE)
  }))
  
  # Remove leading "./" and normalize slashes
  relative_paths <- gsub("^\\./", "", files)
  jsonlite::write_json(sort(relative_paths), output, pretty = TRUE, auto_unbox = TRUE)
}

#create_manifest()

