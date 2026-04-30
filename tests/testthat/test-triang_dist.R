test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
test_that("dtriang calcula la densidad correctamente", {
  expect_equal(dtriang(5, 0, 10, 5), 0.2)
  expect_equal(dtriang(11, 0, 10, 5), 0)
  expect_error(dtriang(5, min = 10, max = 0, mode = 5))
})

test_that("ptriang calcula la probabilidad acumulada", {
  expect_equal(ptriang(0, 0, 10, 5), 0)
  expect_equal(ptriang(5, 0, 10, 5), 0.5)
  expect_equal(ptriang(10, 0, 10, 5), 1)
})

test_that("qtriang y rtriang funcionan", {
  expect_equal(qtriang(0.5, 0, 10, 5), 5)
  set.seed(123)
  samples <- rtriang(100, 0, 10, 5)
  expect_true(all(samples >= 0 & samples <= 10))
  expect_length(samples, 100)
})
