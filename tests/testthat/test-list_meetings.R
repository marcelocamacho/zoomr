test_that("list_meetings works", {
  chamadas_marcelo <- list_meetings("marcelocamacho.ufpa@gmail.com")
  testthat::expect_s3_class(chamadas_marcelo,"tbl")
  testthat::expect_equal(ncol(chamadas_marcelo),10)
})
