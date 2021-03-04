# hello

This project is a simple example of a C program which can be compiled 

  - commandline with a make file
  - Visual Studio with a solution file

The source is arranged to make it straightforward to replace place holders for a number of build constaints.

The program outputs a fixed string and then outputs these build info constaints.

There are a number of batch files intended for use in a Jenkins build

## pre-build.bat
 
  Calculates the version number based on the `BUILD_ID` environment variable

  Replaces place holders in `version.h` header file for build info taken from the environment 

## build.bat

  Calls the makefile to build the program

  Assembles the build output into a single zip file

## test.bat

  A script file which tests the built program and returns an exit status indicating the success of the test

## deploy.bat

  Calls Maven to deploy the zip file (i.e. the artifact) into the repository. This requires the repository credentials to set in `%USERPROFILE%\.m2\settings.xml` with the appropiate username/passwords


  Sample `settings.xml`
  ``` xml
  <settings>
    <servers>
        <server>
            <id>build</id>
            <username>JamesBond</username>
            <password>TopSecret</password>
            <configuration></configuration>
        </server>

        <server>
            <id>snapshots</id>
            <username>JamesBond</username>
            <password>TopSecret</password>
        </server>
    </servers>
</settings>
  ```

## Visual Studio Solution

There is also a `Visual Studio Solution` for use in a development environment


