# BEES-Academy

## Before start your code:

### Run the following command inside the framework cloned repository folder:

''
./setupenv.sh
''

### Activate the PyCharm with correct Interpreter, follow the steps

#### Open the PyCharm menu

#### Open the Preferences

#### Search for Interpreter

#### Create a new Python Interpreter, this option is a GEAR => until "PyCharm 2021.2 (Professional Edition)"

#### Select "Virtualenv > Existing environment" > Search for your /Users/<username>/.../bees-academy/venv/bin/python3.9

#### PyCharm should detect and activate venv automatically for this project.

#### To run the current test, execute the following command on terminal: Doc: https://docs.pytest.org/en/7.0.x/reference/reference.html?highlight=run#pytest.Pytester.run

''
pytest --verbose --tb=short
''
