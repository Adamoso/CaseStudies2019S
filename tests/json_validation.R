library(testthat)
library(jsonlite)
library(readr)


json_files <- list.files(pattern = "*.json$", recursive = TRUE)

test_that("validate jsons", {
  for(json in json_files){
    json_to_validate <- read_file(json)
    is_json_valid <- validate(json_to_validate)
    if(!is_json_valid) print(json)
    expect_true(is_json_valid)
  }
})


dataset_json_files <- list.files(pattern = "dataset.json$", recursive = TRUE)

test_that("validate data set jsons", {
  for(json in dataset_json_files){
    json_to_validate <- fromJSON(json)
    expect_equal(colnames(json_to_validate), c("id", "added_by", "date", "name", "source", "url", "number_of_features",
                                               "number_of_instances", "number_of_missing_values",
                                               "number_of_instances_with_missing_values", "variables" ))
  }
})


task_json_files <- list.files(pattern = "task.json$", recursive = TRUE)

test_that("validate task jsons", {
  for(json in task_json_files){
    json_to_validate <- fromJSON(json)
    expect_equal(colnames(json_to_validate), c("id", "added_by", "date", "dataset_id", "type", "target"))
  }
})


model_json_files <- list.files(pattern = "model.json$", recursive = TRUE)

test_that("validate model jsons", {
  for(json in model_json_files){
    json_to_validate <- fromJSON(json)
    expect_equal(colnames(json_to_validate), c("id",  "added_by", "date", "task_id", "dataset_id", "parameters", "preprocessing"))
  }
})


audit_json_files <- list.files(pattern = "audit.json$", recursive = TRUE)

test_that("validate audit jsons", {
  for(json in audit_json_files){
    json_to_validate <- fromJSON(json)
    expect_equal(colnames(json_to_validate), c("id", "date", "added_by", "model_id", "task_id", "dataset_id", "performance"))
  }
})

