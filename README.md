# README


## Basic Requirements:

* Ruby(v=3.0.4) 


## Steps to setup:

* Clone the project - 

```
git clone https://github.com/Prabhkiratsinghturke/incubyte_tdd_assessment.git
```

* Navigate to the project directory -
```
cd incubyte_tdd_assessment
```

* Install bundler -

```
gem install bundler
```

* Then run -

```
bundle install 
```

## Steps to Test the desired results:


* Open terminal in your project directory
* Run RSpec -

```
rspec
```

## Valid input strings include:

- "1\n2,3"
- "//;\n1;2"
- "1\n2\n,3"
- "1\n2\n,3\n"
- "1,2,3"
- "1\n,3"
- And others


## Invalid input strings include:

- "1,\n"
- "1\n2,"
- "1,\n,3\n"
- "1,2,"
- And others