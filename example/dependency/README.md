# Dependency Example

Reference the common example documentation in `example/README.md` for additional information common to all the examples.

## Overview

This example demonstrates rendering a template using the SCons `Mako` builder where the template depends on another file from which it loads data.

In this example, since the dependency on the data file is hidden from SCons the dependency must be explicitly declared with the following line in the `SConstruct` file.

```python
env.Depends(mako, data)
```

## Execution 

Reference the common example documentation in `example/README.md` for guidance on running the example.

## Expected Results

The file `expected.txt` contains the content that should be rendered when the template is successfully rendered.
