# Showcase ![tests](https://github.com/JaspervanRiet/Showcase/actions/workflows/tests.yaml/badge.svg)
A Flutter app showcasing a maintainable structure and a quality test infrastructure, a simple demo app basically. Retrieves the [NASA Astronomy Picture of the Day](https://github.com/nasa/apod-api) and shows it.

Contains:
- Uses the NASA APOD API to retrieve an image, with API key supplied via a `--dart-define`
- Fully dynamic design system (padding and theming)
- ~95% test coverage
	- Achieved using Riverpod, allowing us to make every layer (services, business logic, etc) mockable.
- Golden tests to allow changing the UI without having to rewrite tests, but still having the validation quality of tests
	- Note: in production code these should be augmented by both unit and integration tests. For this sample app, one type is sufficient to fully validate.
