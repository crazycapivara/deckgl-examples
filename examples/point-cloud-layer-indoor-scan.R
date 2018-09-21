## @knitr point-cloud-layer

library(deckgl)

sample_data <- "https://raw.githubusercontent.com/crazycapivara/deckgl-examples/master/data/json/indoor-scan.json"

properties <- list(
  coordinateSystem = JS("COORDINATE_SYSTEM.IDENTITY"),
  getPosition = JS("d => [d.X, d.Y, d.Z]"),
  getNormal = c(0, 1, 0),
  getColor = c(255, 255, 255),
  radiusPixels = 0.5
)

initial_view_state <- list(
  lookAt = c(0, 0, 0),
  distance = JS("OrbitView.getDistance({boundingBox: [1, 1, 1], fov: 30})"),
  rotationX = 0,
  rotationOrbit = 0,
  orbitAxis = "Y",
  fov = 30,
  minDistance = 0.5,
  maxDistance = 3,
  zoom = 1
)

deckgl(
  width = "100%",
  initialViewState = initial_view_state,
  views = JS("new OrbitView()")
) %>%
  add_point_cloud_layer(data = sample_data, properties = properties) %>%
  onRender("() => deckglWidget.element.style.background = 'black'")
