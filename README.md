Wercker step find zip [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/tcnksm/wercker-step-zip/blob/master/LICENCE)
====

This is [wercker](http://wercker.com/) build step script to package your directories as `.zip`. 

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
steps:
   - rhelling/find-zip:
     find: $WERCKER_OUTPUT_DIR/dist/assets
     zipname: $WERCKER_OUTPUT_DIR/release.zip
```

You must set `find` to the directories you want to package are in and `output` directory where zip archeives will be generated. Both must be set as absolte path (`$WERCKER_OUTPUT_PATH` is built-in environmental valiable which is used for pass the artifacts between build step and deploy step). 

## Requirements

If you use wercker-box which is not installed `zip`, you need additional step:

```yaml
steps:
    - script:
      name: install zip:
      code: |
        sudo apt-get update -y
        sudo apt-get upgrade -y
        sudo apt-get install -y zip
    - rhelling/zip
        find: "dist/assets"
        zipname: "dist/release.zip"
```

## Author:
[rhelling](https://github.com/rhelling)

## Credits:
[tcnksm](https://github.com/tcnksm)
