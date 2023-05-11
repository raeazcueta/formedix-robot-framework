# Formedix Robot Framework

Robot Framework Template -  KDT (Keyword Driven Test) using Page Object Model 

## Usage

All required Robot dependencies can be found in `requirements.txt`.  Make sure to `pip install` the needed packages in 
order to access the Robot CLI. The Robot framework requires a Chrome driver to run its script, which can be downloaded 
from https://chromedriver.chromium.org/downloads.

### Environment configuration

The Robot script takes fetches its environment variables from a file called `evnConfig.ini`, which includes the server 
and the Test Cases are meant to run on. Your evnConfig file is not meant to be committed, it is scrubbed by .gitignore, 
as is `userProfiles.json`, which includes the user's information. 

If you add a new environment variable to evnConfig, make sure to add that variable to get parsed by the 
`ConfigEnvironment.py` script.

**userProfiles.json**
```
{
    "user0": {
        "userName": "xxxxxxxx",
        "userPassword": "x-password"
    },
    "user1": {
        "userName": "yyyyyyyy",
        "userPassword": "y-password"
    }
}
```

### Local Development

To run the entire Regression Test Suite, run the following command.

```
robot -d Results .\TestCases
```

You can run individual Test Suites for different pages by specifying which Robot file you want to run.  Example:

```
robot -d results TestCases/TC001*.robot
```