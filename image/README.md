# 'drizzlepac' Docker Build

Migrating `drizzlepac` to use a Dockerfile provides Engineers to setup and run code locally fast for debugging or have a script that'll instruct the Engineer on how to build packages from source without having to learn a crypt build DSL

## Pull from Container Repository

Having debug builds and production builds in a container repository could accelerate Engineer contributions by reducing initial build time

## Cloud Agents

With the implementation of Science Plateform Branch Jenkins, Dockerfiles will be the primary driving force to run builds in AWS CodeBuild via Jenkins Pipelines

## Local Setup

* Install Docker
* Clone git@github.com:spacetelescope/drizzlepac.git
* Run the following scripts

```
$ docker build . -t drizzlepac -f image/Dockerfile
$ docker run -it --name drizzlepac --rm drizzlepac
```

From within the new docker container

```
export TEST_BIGDATA=https://bytesalad.stsci.edu/artifactory
pip install numpy astropy codecov pytest-cov -U
pip install -U -e '.[test]'
pytest --cov=./ --basetemp=tests_output --junitxml results.xml --bigdata
# codecov
```
