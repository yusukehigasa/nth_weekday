# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.1] - 2025-05-11

### Added
- Integrated RuboCop for code style checking in CI pipeline
- Updated documentation to include code style information

### Changed
- Updated GitHub Actions workflow to use actions/checkout v4
- Fixed CI configuration to ignore vendor directory in RuboCop checks

## [0.1.0] - 2025-05-10

### Added
- Initial release
- Core functionality to get nth weekday (`NthWeekday.get`) of any month/year
- Support for getting days like "3rd Wednesday" or "last Friday" of a month
- Comprehensive test suite
- Examples in `/examples` directory

[0.1.1]: https://github.com/yusukehigasa/nth_weekday/releases/tag/0.1.1
[0.1.0]: https://github.com/yusukehigasa/nth_weekday/releases/tag/0.1.0
