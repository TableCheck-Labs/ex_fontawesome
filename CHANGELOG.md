## v0.5.0 (2021-10-21)

- Upgraded to Surface v0.6.0
- Removed support for Phoenix HTML v2

## v0.4.0 (2021-09-05)

- Upgraded to Phoenix HTML v3.0
- Upgraded to Phoenix LiveView v0.16
- Upgraded to Surface v0.5.2

#### Breaking Changes

- Renamed `FontAwesome.Components.Icon` to `FontAwesome.Surface.Icon`

#### Enhancements

- Added support for heex templates with a new Phoenix LiveView component `FontAwesome.LiveView.icon`

## v0.3.1 (2021-09-03)

- Added support for Phoenix HTML v0.3

## v0.3.0 (2021-06-18)

#### Breaking Changes

- Upgraded to Surface v0.5.0

## v0.2.0 (2021-06-07)

#### Breaking Changes

- Replaced `icon/3` with `icon/2`, the `type` argument should be passed as an option instead

#### Enhancements

- Added `:type` to config for setting the default icon type

## v0.1.1 (2021-05-29)

- All options passed to `icon/3` will be added to the SVG tag as HTML attributes
- Added `opts` prop to the Surface Icon component, which will be added to the SVG tag as HTML attributes

## v0.1.0 (2021-05-24)

- Initial release
