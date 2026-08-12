
<!-- README.md is generated from README.Rmd. Please edit that file -->

# configr

<!-- badges: start -->

<!-- badges: end -->

<img src="logo.png" align="right" width="225"/>

*Configr* is a repository for our development stack, designed to
streamline and standardize the setup of projects. It provides a curated
collection of reusable configuration files (Ansible, Bash, Docker, CI/CD
templates, etc.) that can be easily integrated into projects, ensuring
consistency and efficiency across the board while reducing the urge to
invent the same wheel. Furthermore, it is a central place for pre-built
Docker images that can be pulled and used in development environments,
eliminating the need and hassle to build images them from scratch.
Finally, this repository is accompanied by it own command-line
interface.

> “The right tool, in the right place, for the right job.”

## configr-cli

`configr-cli` is a command-line interface designed to fetch
configuration files from *configr* via shell. It connects to the GitLab
API to retrieve the latest version of a file, allowing users to inspect,
copy, or replace local versions with ease. After the installation of the
Python package, you only need to remember one command to have all the
config files at your disposal. Run `configr fetch <foldername>` via
shell to get one of the config files, or simply `configr fetch` to get
the entire list.

``` bash
configr fetch

? Select a config file to fetch: 
> ansible/deploy-plumbr.yml
  ansible/deploy-shiny.yml
  cicd/build_pkgdown.yml
  docker/oddjob/Dockerfile
  docker/r-dev/Dockerfile
  makefiles/Make_R.mk
  ❌ Cancel
```

Visit [configr-cli
website](https://edgar-treischl.pages.gitlab.lrz.de/configr-cli/) for
more information.

<br/>

## Available Files

Please find a list of available config files below. The files are
organized into folders based on their purpose:

#### Config Types

| **Config**   | **Description**                             | **Folder**   |
|--------------|---------------------------------------------|--------------|
| 🕹️ Ansible   | Infrastructure-as-Code playbooks and roles  | `ansible/`   |
| 📜 Scripts   | Bash scripts that just run                  | `bash/`      |
| ⚙️ Configs   | Shared config templates (e.g. `.gitignore`) | `config/`    |
| 🛠️ CI/CD     | GitLab CI templates for builds and deploys  | `cicd/`      |
| 🐳 Docker    | Prebuilt development containers             | `docker/`    |
| 📝 Docs      | Quarto docs and branding (e.g. `brand.yml`) | `quarto/`    |
| 🧰 Makefiles | Common `make` targets                       | `makefiles/` |

#### Config Files

``` r
jsonlite::fromJSON("manifest.json")
#>  [1] "ansible/deploy-plumbr.yml"       "ansible/deploy-shiny.yml"       
#>  [3] "cicd/build_docker.yml"           "cicd/build_pkgdown.yml"         
#>  [5] "cicd/clone_repo.yml"             "docker/amtschulverse/Dockerfile"
#>  [7] "docker/r-dev/Dockerfile"         "docker/r-shiny/Dockerfile"      
#>  [9] "makefiles/make_quarto.mk"        "makefiles/make_R.mk"
```

## Cooperation

Issues, pull requests, any suggestions are welcome — we’re forging this
stack together. Read also the Docker [**overview**](docs/docker.qmd)
page if you want to create and share a prebuilt image *configr*.
