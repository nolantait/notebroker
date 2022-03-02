# Notebroker

Supports turning ipynb python notebooks into the following formats:

- Markdown

This library is in alpha and might not support everything. You can see
the example file which I will make harder over time at `spec/fixtures`.

Plans are to support more formats like:

- HTML
- MDX

I wrote this library to make it easier to write blog posts through NextJS
using notebook code. Instead of dealing with the delicate javascript build
ecosystem I decided to extract it into a more sane ruby gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'notebroker'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install notebroker

## Usage

From your terminal you can run the cli:

```
notebroker --convert notebooks/my-notebook.ipynb --destination ./
...
Converting notebooks/my-notebook.ipynb into markdown...
Saved markdown file to ./
```

## Formatting

This is an example of the input and converted markdown file generated:

### Input

```json
{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "3715d426-5951-4b56-b202-2457e1f7742f",
   "metadata": {},
   "source": [
    "# Test file 1\n",
    "\n",
    "This is the first line.\n",
    "\n",
    "This is the end of the first section"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "206fb993-c482-49fa-aa50-95aa25dcff71",
   "metadata": {},
   "outputs": [],
   "source": [
    "import code\n",
    "\n",
    "def a_function(some_parameter):\n",
    "    return some_parameter\n",
    "\n",
    "def calculate_something(n):\n",
    "    '''\n",
    "    this is a comment\n",
    "    '''\n",
    "    \n",
    "    # This is another comment\n",
    "    return something"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b09f90d3-97f1-4ed4-903e-4e62060e35e5",
   "metadata": {},
   "source": [
    "## Subheader: The third cell\n",
    "\n",
    "A single line in the third cell\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "bea26222-75b8-4cf6-9367-52c94344dd8e",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "This is the result of a cell\n",
      "----------------------------------------\n",
      "Total amount paid will be $251,717.22\n"
     ]
    }
   ],
   "source": [
    "print(\"This is the result of a cell\")\n",
    "print(\"Total amount paid will be ${:,.2f}\".format(total_amount))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "477b0f9b-5d79-4275-966b-4ef38a6dfc2d",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.10"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
```

### Output

```markdown
# Test file 1

This is the first line.

This is the end of the first section

```python
import code

def a_function(some_parameter):
    return some_parameter

def calculate_something(n):
    '''
    this is a comment
    '''
    
    # This is another comment
    return something
```

## Subheader: The third cell

A single line in the third cell

```python
print("This is the result of a cell")
print("Total amount paid will be ${:,.2f}".format(total_amount))
```

```shell
This is the result of a cell
----------------------------------------
Total amount paid will be $251,717.22
```
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nolantait/notebroker.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
