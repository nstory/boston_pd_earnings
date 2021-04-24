# Boston Police Earnings
Annual earnings of Boston Police Department officers and civilian employees from 2011 through 2020.

## What does this code do?
This project takes as input:
* [Employee Earnings Reports 2011 - 2020](https://data.boston.gov/dataset/employee-earnings-report) from [Analyze Boston](https://data.boston.gov/) (the city's data portal)
* multiple listings (rosters) of Boston Police officers containing employee ids and badge numbers: [2020 Alpha Listing](https://www.wokewindows.org/data_sources/alpha_listing_20200715), [BPD Alpha Listing with Badges](https://www.wokewindows.org/data_sources/alpha_listing), [BPD CY2015 Annual Earnings File](https://www.wokewindows.org/data_sources/cy2015_annual_earnings)

and produces as output:
* [2011_2020_bpd_earnings_with_ids.csv](https://wokewindows-data.s3.amazonaws.com/2011_2020_bpd_earnings_with_ids.csv) &mdash; this file contains payroll data (annual totals) for all Boston Police Department officers from 2011 through 2020. In addition, each row has been augmented with the employee id of the individual (matched by name against the roster files); this allows salary data to be imported into [Woke Windows](https://www.wokewindows.org/), which uses the employee id as the key to identify an individual
* [2011_2020_bpd_earnings_with_ids.xlsx](https://wokewindows-data.s3.amazonaws.com/2011_2020_bpd_earnings_with_ids.xlsx) &mdash; same but as an Excel file

## RUNNING
The only requirement for running this project is a working install of [Docker](https://www.docker.com/). All other dependencies are managed in the [Dockerfile](Dockerfile).

```
$ make docker-build
...
$ make docker-run
/volume # make clean all # generated files are stored in output/
/volume # make deploy # upload files to S3
```

## LICENSE
This project is released under the MIT License.
