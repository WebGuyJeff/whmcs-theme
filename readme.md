# Theme files for my WHMCS install.

I got sick of trying to hack away on my live server, so I built this workflow with a local install of WHMCS for a proper dev solution.

### Dev Commands

`npm run dev` - Browser sync with CSS injection and fast reload for JS and TPL upon file changes.
`npm run build` - Builds CSS and JS into the production locations.
`npm run build:min` - Builds Production-ready minified CSS and JS into the production locations.
`npm run dist` - Package as a zip in /dist.

_See package.json for more._

### Upstream WHMCS Theme Twenty one

A copy of Tweny One is included in reference/ for easy comparison.

`npm run getupstream` - Update the local reference repo.
