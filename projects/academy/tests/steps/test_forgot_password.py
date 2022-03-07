from pytest_bdd import scenarios, given, parsers, when, then
from projects.academy.utils.logger import logger

scenarios('../features/forgot_password.feature')


@given(parsers.parse('"{user_name}" is logged in to the application'))
def step_impl(user_name):
    logger.info(f'pass -- {user_name}')


@given('she recovered her password by email')
def step_impl():
    logger.info('pass --> Step: Given she recovered her password by email')


@given('she recovered her password by email "<test>"')
def step_impl(test):
    logger.info('pass --> Step: Given she recovered her password by email')


@given('she logs out of the application through home')
def step_impl():
    logger.info('pass --> Step:And she logs out of the application through home')


@when('she logs into the application with the password recovered')
def step_impl():
    logger.info('pass --> Step: When she logs into the application with the password recovered')


@then('she must be successfully logged in')
def step_impl():
    logger.info('pass --> Step: Then she must be successfully logged in')
