library(frictionless)
# Lendo

package <- frictionless::read_package("https://zenodo.org/record/5879096/files/datapackage.json")

package$id

package$profile

package$resources

package$resource_names

package$directory


gps <- frictionless::read_resource(package, "gps")
gps



local_package <- frictionless::read_package(
  system.file("extdata", "datapackage.json", package = "frictionless")
)
frictionless::read_resource(local_package, "media")

# Criando ---------

# Show content of the data frame "iris"
dplyr::as_tibble(iris)



my_package <- frictionless::create_package()

my_package_iris <- my_package |>
  frictionless::add_resource(resource_name = "iris", data = iris)

iris_schema <-
  my_package_iris %>%
  frictionless::get_schema("iris")

str(iris_schema)


iris_schema <- create_schema(iris)

iris_schema$fields[[1]]$description <- "Sepal length in cm."
# Show result
str(iris_schema$fields[[1]])



# Remove description for first field
iris_schema$fields[[1]]$description <- NULL

# Set descriptions for all fields
descriptions <- c(
  "Sepal length in cm.",
  "Sepal width in cm.",
  "Pedal length in cm.",
  "Pedal width in cm.",
  "Iris species."
)
iris_schema$fields <- purrr::imap(
  iris_schema$fields,
  ~ c(.x, description = descriptions[.y])
)

str(iris_schema)

my_package <-
  my_package_iris %>%
  remove_resource("iris") %>% # Remove originally added resource
  add_resource(
    resource_name = "iris",
    data = iris,
    schema = iris_schema # Your customized schema
  )

# Two CSV files with the same structure
path_1 <- system.file("extdata", "observations_1.csv", package = "frictionless")
path_2 <- system.file("extdata", "observations_2.csv", package = "frictionless")

# Add both CSV files as a single resource
my_package <-
  my_package %>%
  add_resource(resource_name = "observations", data = c(path_1, path_2))


my_package <- append(my_package, c(name = "my_package"), after = 0)
# Or with purrr::prepend(): prepend(my_package, c(name = "my_package))
my_package <- append(my_package, c(title = "My package"), after = 1)


write_package(my_package, "my_directory")


mtcars |> readr::write_csv("mtcars.csv.gz")
