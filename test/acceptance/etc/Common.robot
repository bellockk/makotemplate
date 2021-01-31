*** Settings ***
Library  Process
Library  OperatingSystem

*** Variables ***

*** Keywords ***
The System Under Test
  Copy Directory  ${CURDIR}${/}..${/}..${/}..${/}makotemplate  .
  
A Simple Template
  Create File  SConstruct  import os\nimport SCons\nSCons.Tool.DefaultToolpath.insert(0, os.curdir)\nenv = DefaultEnvironment(tools=['makotemplate'])\nenv.Mako('template.txt', 'template.txt.mako', MAKO_DICTIONARY={'FOO': 'BAR'})
  Create File  template.txt.mako  \${FOO}

The ${example} example
  Set Test Variable  ${example}
  Copy Directory  ${CURDIR}${/}..${/}..${/}..${/}example${/}${example}  example${/}${example}

SCons is executed
  ${result} =  Run Process  ${SCONS}  stderr=STDOUT  stdout=stdout.txt
  Log Many  ${result.rc}  ${result.stdout}
  Set Test Variable  ${OUTPUT}  ${result.stdout}
  Set Test Variable  ${RC}  ${result.rc}
  Should be Equal as Integers  0  ${RC}

SCons is executed in the example
  ${result} =  Run Process  ${SCONS}  cwd=example${/}${example}  stderr=STDOUT  stdout=stdout.txt
  Log Many  ${result.rc}  ${result.stdout}
  Set Test Variable  ${OUTPUT}  ${result.stdout}
  Set Test Variable  ${RC}  ${result.rc}
  Should be Equal as Integers  0  ${RC}
  Move File  example${/}${example}${/}template.txt  template.txt

The rendered template will match the supplied expected content
  ${expected} =  Get File  example${/}${example}${/}expected.txt
  ${expected} =  Evaluate  $expected.strip()
  ${actual} =  Get File  template.txt
  ${actual} =  Evaluate  $actual.strip()
  Should be equal  ${expected}  ${actual}

The Template ${tense} Rendered
  File Should Exist  template.txt
  ${FILE_CONTENT} =  Get File  template.txt
  Set Test Variable  ${FILE_CONTENT}

The MAKO_DICTIONARY is modified in the SCons script
  Remove File  SConstruct
  Create File  SConstruct  import os\nimport SCons\nSCons.Tool.DefaultToolpath.insert(0, os.curdir)\nenv = DefaultEnvironment(tools=['makotemplate'])\nenv.Mako('template.txt', 'template.txt.mako', MAKO_DICTIONARY={'FOO': 'BAR2'})

The template is modified
  Remove File  template.txt.mako
  Create File  template.txt.mako  Another \${FOO}

The template will be rendered again
  ${NEW_FILE_CONTENT} =  Get File  template.txt
  Should not be Equal  ${FILE_CONTENT}  ${NEW_FILE_CONTENT}

Setup Temporary Directory
  [Documentation]  Creates a temporary workspace for test, and sets the current working directory to that path.
  ${PRIOR_DIRECTORY} =  Evaluate  os.path.abspath(os.curdir)  os
  ${TEMPORARY_TEST_WORKSPACE} =  Evaluate  os.path.abspath(tempfile.mkdtemp())  os, tempfile
  Set Test Variable  ${PRIOR_DIRECTORY}
  Set Test Variable  ${TEMPORARY_TEST_WORKSPACE}
  Evaluate  os.chdir(r'${TEMPORARY_TEST_WORKSPACE}')  os

Teardown Temporary Directory
  [Documentation]  Cleans up the temporary workspace for this test.
  Variable Should Exist  ${PRIOR_DIRECTORY}
  Variable Should Exist  ${TEMPORARY_TEST_WORKSPACE}
  Evaluate  os.chdir(r'${PRIOR_DIRECTORY}')  os
  ${save_path} =  Set Variable  ${OUTPUT_DIR}${/}failed${/}${TEST_NAME}
  Remove Directory  ${save_path}  True
  Run Keyword If Test Passed  Run Keyword and Return Status  Remove Directory  ${TEMPORARY_TEST_WORKSPACE}  True
  Run Keyword If Test Failed  Move Directory  ${TEMPORARY_TEST_WORKSPACE}  ${save_path}
