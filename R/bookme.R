
#' Wrapper of bookdown::render_book, running it in input_dir
#'
#' bookdown::render_book renders "multiple R Markdown files
#' under the current working directory into a book".
#' That is, IMHO, unfortunate. In particular, when the book
#' is not the root of your project, you would have to mess with
#' setwd() or the like and {here} won't help you either.
#' This function works around this issue by leveraging xfun::in_dir
#' to run bookdown::render_book in the input_dir of your choice.
#' Then I do not have to deal myself with setwd() and changing it back.
#'
#' In addition, the function calls base::shell to open the book in the
#' default viewer for the output
#'
#' @param input_dir the main directory of the book
#' @param input_files character vector with input files, in case you do not
#'                    want to render them all (the default)
#' @param output_dir character vector where to  put the rendered book
#' @param output_format https://bookdown.org/yihui/bookdown/output-formats.html
#'
#' @return character vector with the path to the output
#' @export
#'
#' @examples
#' bookme("report")
bookme <- function(input_dir, input_files = "*", output_dir = NULL,
                   output_format = NULL) {

  target_file <- xfun::in_dir(input_dir, {
    bookdown::render_book(
      input = input_files,
      output_format = output_format,
      output_dir = output_dir
  )})

  try(base::shell(target_file, wait = FALSE), silent = TRUE)

  target_file
}
