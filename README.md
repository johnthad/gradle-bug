# Gradle distributions bug

This software demonstrates a problem with Gradle's distributions exclude.

A discussion of this problem may be found on Gradle's [Help/Discuss](https://discuss.gradle.org/t/distzip-always-up-to-date-with-exclude/25223) support page.

## The Problem

Gradle marks as `UP-TO-DATE` `distTar`, `distZip`, and `assembleDist` if an `exclude` closure is used in `distributions`. (See `build.gradle`.) The `build/distrbutions` directory is not even created.

This is a problem because (for various reasons) I do not want to use Gradle's generated scripts, but a script of my own devising. However I am unable to exclude them from the final zip file.
