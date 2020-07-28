This app is for use with the [AL Test Runner](https://marketplace.visualstudio.com/items?itemName=jamespearson.al-test-runner) extension for Visual Studio Code which helps to write and run tests for Microsoft Dynamics 365 Business Central.

This app adds a new test runner codeunit and exposes a codeunit as a web service to invoke test runs.

## Debugging
The initial motivation for creating the app is to be able to debug tests.

This app should be published into the Business Central container / environment. 

The AL Test Runner extension has a *testRunnerServiceUrl* key that specifies the OData endpoint to call the test runner service. The URL will be in the format:

http[s]://[server]:[OData port]/[server instance]/TestRunner_RunTest?company=[BC company name]

e.g. for a Docker container named 'test' with the default port of 7048 and a company name of 'CRONUS International Ltd.'

http://test:7048/BC/ODataV4/TestRunner_RunTest?company=CRONUS%20International%20Ltd.

Create a debug configuration in the launch.json file of the project to attach the debugger to the Business Central service. AL Test Runner will attempt to attach the first debugger configuration in that file before running the test.