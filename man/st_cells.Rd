% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stars.R
\name{st_cells}
\alias{st_cells}
\title{return the cell index corresponding to the location of a set of points}
\usage{
st_cells(x, sf)
}
\arguments{
\item{x}{object of class \code{stars}}

\item{sf}{object of class \code{sf} or \code{sfc}}
}
\description{
If the object has been cropped without normalization, then the indices return
are relative to the original uncropped extent.  See \code{\link{st_crop}}
}
\examples{
set.seed(1345)
st_bbox(L7_ETMs) |> 
  st_as_sfc() |> 
  st_sample(10) -> pts 
(x <- st_cells(L7_ETMs, pts))
# get the pixel values (first band only):
st_as_stars(L7_ETMs)[[1]][x]
# get pixel values for all bands:
st_as_stars(L7_ETMs) |> split() |> sapply(`[`, x)
# compare with st_extract():
st_as_stars(L7_ETMs) |> split() |> st_extract(pts)
}
