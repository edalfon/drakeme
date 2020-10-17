# Our boilerplate for `drake`-powered projects

This is based on McBain's [`dflow`](https://github.com/MilesMcBain/dflow)
and it is tailored to our report-generating projects.

Basically it includes a couple of convenience features (hopefully, sufficiently
documented in their respective files) that can be summarized as follows:

- Sets the stage for the project to produce a report with `bookdown`. 
  Simply add .Rmd files to the "report" folder and you are good to go.
- Proposes a one-plan-per-chapter approach (defining the plans within functions 
  to help code navigation).
- A couple of wrappers for `drake` functions to better fit our needs.

We are just test-driving this. Meanwhile the way to use it is simply to 
clone it:

`
git clone https://github.com/edalfon/drakeme NEW_PROJECT_DIR
`

And then remove all git info and create a new repository for the project.

(perhaps later we just put a package out there, similar to `dflow` that 
uses a `usethis`-style function to add our custom `drake` infrastructure to 
an existing project. Let's see how it goes. After all, this is part of a 
process of making some of our tools public).

In addition, those of us wanting to use `devtools::load_all()` should
start by calling `usethis::use_description()`.
