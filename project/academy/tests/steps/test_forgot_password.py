from pytest_bdd import scenarios, given, parsers, when, then
from project.logger import logger

scenarios('../features/forgot_password.feature')


@given(parsers.parse('that {user} as an ADM user is in the login screen'))
def step_impl(user):
    logger.info(f'pass -- {user}')


@given('she recovered his password by email')
def step_impl():
    logger.info('pass --> Step: Given she recovered his password by email')


@given('she logs out of the application through home')
def step_impl():
    logger.info('pass --> Step:And she logs out of the application through home')


@when('she logs into the application with the password recovered')
def step_impl():
    logger.info('pass --> Step: When she logs into the application with the password recovered')


@then('she must be successfully logged in')
def step_impl():
    logger.info('pass --> Step: Then she must be successfully logged in')
