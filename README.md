# metadata #

metadata is an [R](http://www.r-project.org) package with functions for adding
and retrieving metadata to and from datasets.


## Installing ##

metadata is not available on [CRAN] (https://cran.r-project.org/). In order to
use it you must install from this GitHub repository. The most simple method is
by using `devtools`. First install and load `devtools`:

````{r}
install.packages("devtools")
library(devtools)
````
Once `devtools` has been loaded, `limestats` can be installed and loaded with:

````{r}
install_github("ofurkusi/metadata")
library(metadata)
````

## Using metadata ##

Load or create your dataset, in this case a sample ``df`` data.frame is
created and some metadata added.

````{r}
> df <- data.frame(l = c(1, 2, 3), r = c(4, 5, 6))
> metadata(df) <- list(Title = "My numbers", Source = "Hand input")
````

You can retrieve and print the metadata by calling
````{r}
> metadata(df)
Title:   My numbers
Source:  Hand input
````

Or access individual metadata elements, e.g.
````{r}
metadata(df)$Title
[1] "My numbers"
````

You can use any keywords you like as long as you provide a valid ``list``
object.

The metadata is stored as an attribute to your data.frame and can be accessed
manually like any other attribute
````{r}
> attributes(df)
$names
[1] "l" "r"

$row.names
[1] 1 2 3

$class
[1] "data.frame"

$metadata
$metadata$Title
[1] "My numbers"

$metadata$Source
[1] "Hand input"
````

## Reading attributes from a file ##
You can store your attributes in a separate file alongside your dataset and
load it at the same time you load your data. As an example, take the following
[YAML] (http://yaml.org/) stored in the file ``metadata.yml``:

````{yaml}
---
Title:    Number of starships by stardates
Source:   United Federation of Planets
Updated:  -306869.6025602105
````

When loading the dataset
````{r}
library(yaml)

starships <- read.csv("starships.csv")
metadata(starships) <- yaml.load_file("metadata.yml")
````



## License ##

This package is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License, version 3, as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.  See the GNU
General Public License for more details.

A copy of the GNU General Public License, version 3, is available at
<http://www.r-project.org/Licenses/GPL-3>