# promodomo

## Why? 
Because I wanted to build something with haskell, also people kept asking how to actually test their implementations

## How to use?
(Assuming ghc is installed)  
  
#### 0. Get the repo
Either [clone it](https://github.com/LordBurtz/promodomo.git) or download the zip [here](https://github.com/LordBurtz/promodomo/archive/refs/heads/master.zip)

#### 1. Get stack (build tool)
Visit [their site](https://docs.haskellstack.org/en/stable/install_and_upgrade/#__tabbed_3_1) and install or copy and paste this  
  
Linux:
```sh
curl -sSL https://get.haskellstack.org/ | sh
```  
  
macOS:
```sh
curl -sSL https://get.haskellstack.org/ | sh
```  
  
windows:
Use the website its too hard frfr  
  

## Running and using stuff
After unpacking the .zip or downloading the repo, open the new directory (hint: called `promodomo` in your favourite text editor).  

Edit `Week03.hs` which is in`src/week03/`, then try it in `ghci`
```sh
 > cabal repl
```  
  
Once you are done, run the test suit via
```sh
 > cabal test week03
```

## Or:
Edit Week{number}.hs and open a PR, githubs CI will test it for you  
(*You can even edit the files in the browser ughh*)
  
fr not that easy to mess up, JUST STAY IN THE FILES I PROVIDED AND USE THE FUNCTION NAMES AND DEFINITIONS 
