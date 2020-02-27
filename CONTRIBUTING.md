
This document was adapted from the [cookiecutter](https://github.com/audreyr/cookiecutter-pypackage).

## Contributing

Contributions are welcome, and they are greatly appreciated! Every little bit
helps, and credit will always be given.

You can contribute in many ways:

## Types of Contributions


### Report Bugs

Report bugs at https://github.com/aromatic-toast/altairexpress/issues.

If you are reporting a bug, please include:

* Your operating system name and version.
* Any details about your local setup that might be helpful in troubleshooting.
* Detailed steps to reproduce the bug.

### Fix Bugs

Look through the GitHub issues for bugs. Anything tagged with "bug" and "help
wanted" is open to whoever wants to implement it.

### Implement Features

Look through the GitHub issues for features. Anything tagged with "enhancement"
and "help wanted" is open to whoever wants to implement it.

### Write Documentation

altairexpress could always use more documentation, whether as part of the
official altairexpress docs, in docstrings, or even on the web in blog posts,
articles, and such.

### Submit Feedback

The best way to send feedback is to file an issue at https://github.com/UBC-MDS/ggexpress/issues.

If you are proposing a feature:

* Explain in detail how it would work.
* Keep the scope as narrow as possible, to make it easier to implement.
* Remember that this is a volunteer-driven project, and that contributions
  are welcome :)

## Get Started!

Ready to contribute? Here's how to set up `ggexpress` for local development.

1. Fork the `ggexpress` repo on GitHub.

2. Clone your fork locally:

	```
	git clone git@github.com:your_name_here/ggexpress.git
	```

3. Create a branch for local development:

	```
	git checkout -b name-of-your-bugfix-or-feature
	```

   	Now you can make your changes locally.
   	
4. Load the devtools package, which is the public face of a set of packages that support various aspects of package development.

  ```
  library(devtools)
  ```
For presentation purposes only, we use fs, for filesystem work, and the tidyverse, for light data wrangling.

  ```
  library(tidyverse)
  library(fs)
  ```
5. Now you can make your changes locally. 

6. When you're done making changes, make sure that all the moving parts of the package still work by `check()`.

  ```
  check()
  ```

7. Don't forget to update the tests for the function in the file `tests/testthat/test-FUNCTION_NAME.R`.

4. When you're done updating the test file, check that your changes pass the tests by running `test()`

	```
	test()
	```

6. Commit your changes and push your branch to GitHub:

	```
	git add .
	git commit -m "Your detailed description of your changes."
	git push origin name-of-your-bugfix-or-feature
	```

7. Submit a pull request through the GitHub website.

## Pull Request Guidelines

Before you submit a pull request, check that it meets these guidelines:

1. The pull request should include tests.
2. If the pull request adds functionality, the docs should be updated. Put
   your new functionality into a function with a docstring, and add the
   feature to the list in README.md.
3. The pull request should work for R (at least 3.6.1) and make sure that the tests pass for all supported R versions.



## Code of Conduct

Please note that the ggexpress project is released with [this Contributor Code of Conduct](CONDUCT.md). By contributing to this project you agree to abide by its terms.
