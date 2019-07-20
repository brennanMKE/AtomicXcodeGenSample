# XcodeGen Sample Project

When working with dependencies which are project references often projects are added directly into the parent Xcode project as a reference. Then a `Target Dependency` can be added explicitly for the `Build Target` of a sub-project. Alternatively, an Xcode Workspace can be used with a Build Scheme set to `Find Dependencies Implicitly`. Instead of adding a `Target Dependency` for each dependency the `Build Scheme` is updated to add the dependencies which will product the build project in the required order to make all builds run.

When dependencies are frameworks all that is needed is for the `BUILT_PRODUCTS_DIR` to be populated with those frameworks by the time the main project is built. A workspace can do this with much fewer changes to the main project file.

## Reference

* [XcodeGen#520](https://github.com/yonaskolb/XcodeGen/issues/520)
