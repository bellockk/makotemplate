*** Settings ***
Resource  ${RESOURCES}${/}Common.robot
Test Setup  Setup Temporary Directory
Test Teardown  Teardown Temporary Directory

*** Test Cases ***
MAKO-001
  [Documentation]  Render a template within SCons.
  Given the system under test
  And a simple template
  When SCons is executed
  Then the template will be rendered

MAKO-002
  [Documentation]  Rebuild a template if the MAKO_DICTIONARY changes.
  Given the system under test
  And a simple template
  When SCons is executed
  And the template is rendered
  And the MAKO_DICTIONARY is modified in the SCons script
  And SCons is executed
  Then the template will be rendered again

MAKO-003
  [Documentation]  Rebuild a template if template source has changed.
  Given the system under test
  And a simple template
  When SCons is executed
  And the template is rendered
  And the template is modified
  And SCons is executed
  Then the template will be rendered again

MAKO-004
  [Documentation]  Execute the simple example.
  Given the system under test
  And the simple example
  When SCons is executed in the example
  Then the template will be rendered
  And the rendered template will match the supplied expected content

MAKO-005
  [Documentation]  Execute the dependency example.
  Given the system under test
  And the dependency example
  When SCons is executed in the example
  Then the template will be rendered
  And the rendered template will match the supplied expected content
