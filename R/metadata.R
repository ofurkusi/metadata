metadata <- function(x) {
  if ("metadata" %in% names(attributes(x))) {
    meta <- attributes(x)$metadata
    class(meta) <- c(attr(meta, "class"), "metadata")
    
    return(meta)
  } else {
    message("No metadata found")
  }
}

`metadata<-` <- function(x, value) {
  
  if (!is.list(value)) {
    stop("Metadata must be contained in a list")
  }
  
  if ("metadata" %in% names(attributes(x))) {
    attributes(x)$metadata <- c(attributes(x)$metadata, value)
  } else {
    attributes(x)$metadata <- value
  }
  
  x
}

print.metadata <- function(x, ...) {
  cat(format(x))
}

format.metadata <- function(x, display.width=80, sep="  ", ...) {
  
  col1.width <- max(nchar(names(x))) + 1 # +1 for the ":" sign
  col2.width <- display.width - col1.width - nchar(sep)
  
  emptycol <- paste(rep(" ", col1.width), collapse="")
  
  result <- ""
  
  for (i in 1:length(names(x))) {
    meta.name <- names(x)[i]
    meta.value <- x[[i]]
    
    meta.value <- strwrap(meta.value, col2.width)
    
    meta.name <- paste0(meta.name, ":", paste(rep(" ", times=(col1.width - nchar(meta.name)-1)), collapse=""))
    
    for (i in 1:length(meta.value)) {
      if (i == 1) {
        result <- paste0(result, meta.name, sep, meta.value[i], "\n")
      } else {
        result <- paste0(result, emptycol, sep, meta.value[i], "\n")
      }
    }
    
  }
  
  return(result)
}
