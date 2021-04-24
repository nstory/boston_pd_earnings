RUBY=ruby -r ./lib/main.rb

.EXPORT_ALL_VARIABLES:

.PHONY: all
all: # dependencies defined in rule at bottom of Makefile

# INPUT
EARNINGS_REPORT_2020=input/employee-earnings-report-2020.csv
$(EARNINGS_REPORT_2020): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/e2e2c23a-6fc7-4456-8751-5321d8aa869b/download/city-of-boston-calendar-year-2020-earnings.csv

EARNINGS_REPORT_2019=input/employee-earnings-report-2019.csv
$(EARNINGS_REPORT_2019): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/3bdfe6dc-3a81-49ce-accc-22161e2f7e74/download/allemployeescy2019_feb19_20final-all.csv

EARNINGS_REPORT_2018=input/employee-earnings-report-2018.csv
$(EARNINGS_REPORT_2018): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/31358fd1-849a-48e0-8285-e813f6efbdf1/download/employeeearningscy18full.csv

EARNINGS_REPORT_2017=input/employee-earnings-report-2017.csv
$(EARNINGS_REPORT_2017): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/70129b87-bd4e-49bb-aa09-77644da73503/download/employee-earnings-report-2017.csv

EARNINGS_REPORT_2016=input/employee-earnings-report-2016.csv
$(EARNINGS_REPORT_2016): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/8368bd3d-3633-4927-8355-2a2f9811ab4f/download/employee-earnings-report-2016.csv

EARNINGS_REPORT_2015=input/employee-earnings-report-2015.csv
$(EARNINGS_REPORT_2015): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/2ff6343f-850d-46e7-98d1-aca79b619fd6/download/employee-earnings-report-2015.csv

EARNINGS_REPORT_2014=input/employee-earnings-report-2014.csv
$(EARNINGS_REPORT_2014): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/941c9de4-fb91-41bb-ad5a-43a35f5dc80f/download/employee-earnings-report-2014.csv

EARNINGS_REPORT_2013=input/employee-earnings-report-2013.csv
$(EARNINGS_REPORT_2013): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/fac6a421-72fb-4f85-b4ac-4aca1e32d94e/download/employee-earnings-report-2013.csv

EARNINGS_REPORT_2012=input/employee-earnings-report-2012.csv
$(EARNINGS_REPORT_2012): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/d96dd8ad-9396-484a-87af-4d15e9e2ccb2/download/employee-earnings-report-2012.csv

EARNINGS_REPORT_2011=input/employee-earnings-report-2011.csv
$(EARNINGS_REPORT_2011): URL=https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/a861eff8-facc-4372-9b2d-262c2887b19e/download/employee-earnings-report-2011.csv

EARNINGS_REPORT_2010_PDF=input/CY_2010_BPD_Annual_Earns_tcm3-23571.pdf
$(EARNINGS_REPORT_2010_PDF): URL=https://web.archive.org/web/20111027074801if_/http://www.cityofboston.gov:80/Images_Documents/CY%202010%20BPD%20Annual%20Earns_tcm3-23571.pdf

EARNINGS_REPORT_2009_PDF=input/BPD_CY2009_Annual_Earns_02_02_10_tcm3-12161.pdf
$(EARNINGS_REPORT_2009_PDF): URL=https://web.archive.org/web/20101224085004if_/http://www.cityofboston.gov/Images_Documents/BPD%20CY2009%20Annual%20Earns%2002_02_10_tcm3-12161.pdf

# PDF with employee ids!
EARNINGS_REPORT_2008_PDF=input/EarningsReport08_BPD_tcm3-3308.pdf
$(EARNINGS_REPORT_2008_PDF): URL=https://web.archive.org/web/20170126150436if_/https://www.cityofboston.gov/Images_Documents/EarningsReport08_BPD_tcm3-3308.pdf

PRR_9_4_2020=input/PRR_9_4_2020.xls
$(PRR_9_4_2020): URL=https://wokewindows-data.s3.amazonaws.com/PRR_9_4_2020.xls

CY2015_ANNUAL_EARNINGS_BPD=input/CY2015_Annual_Earnings_BPD.xlsx
$(CY2015_ANNUAL_EARNINGS_BPD): URL=https://cdn.muckrock.com/foia_files/2016/07/27/CY2015_Annual_Earnings_BPD.xlsx

ALPHA_LISTING_WITH_BADGES_2016=input/ALPHa_LISTING_BPD_with_badges_1.xlsx
$(ALPHA_LISTING_WITH_BADGES_2016): URL=https://cdn.muckrock.com/foia_files/2016/07/26/ALPHa_LISTING_BPD_with_badges_1.xlsx

ALPHA_LISTING_WITH_BADGES_2020=input/ALPHa_LISTING_BPD_FRONT_DESK_Badges_included.xlsx
$(ALPHA_LISTING_WITH_BADGES_2020): URL=https://cdn.muckrock.com/foia_files/2020/08/07/ALPHa_LISTING_BPD_FRONT_DESK_Badges_included.xlsx

ALL_INPUT_FILES=$(EARNINGS_REPORT_2020) $(EARNINGS_REPORT_2019) $(EARNINGS_REPORT_2018) $(EARNINGS_REPORT_2017) $(EARNINGS_REPORT_2016) $(EARNINGS_REPORT_2015) $(EARNINGS_REPORT_2014) $(EARNINGS_REPORT_2013) $(EARNINGS_REPORT_2012) $(EARNINGS_REPORT_2011) $(PRR_9_4_2020) $(CY2015_ANNUAL_EARNINGS_BPD) $(ALPHA_LISTING_WITH_BADGES_2016) $(EARNINGS_REPORT_2008_PDF) $(EARNINGS_REPORT_2010_PDF) $(EARNINGS_REPORT_2009_PDF) $(ALPHA_LISTING_WITH_BADGES_2020)

input/%:
	wget '$(URL)' -O $@

.PHONY: all-input-files
all-input-files: $(ALL_INPUT_FILES)

# OUTPUT

MULTIPLE_NAMES=output/multiple_names.csv
$(MULTIPLE_NAMES): $(ALL_INPUT_FILES)
	$(RUBY) -e multiple_names > $@

MULTIPLE_IDS=output/multiple_ids.csv
$(MULTIPLE_IDS): $(ALL_INPUT_FILES)
	$(RUBY) -e multiple_ids > $@

EARNINGS_WITH_IDS=output/2011_2020_bpd_earnings_with_ids.csv
$(EARNINGS_WITH_IDS): $(ALL_INPUT_FILES)
	$(RUBY) -e earnings_with_ids > $@

EARNINGS_WITH_IDS_XLSX=output/2011_2020_bpd_earnings_with_ids.xlsx

ROSTER=output/roster.csv
$(ROSTER): $(ALL_INPUT_FILES)
	$(RUBY) -e roster > $@

# the 44,34,76 magic makes importing utf-8 csv work :shrugs:
%.xlsx : %.csv
	unoconv -i FilterOptions=44,34,76 -f xlsx -o $@ $<

# PHONY TARGETS

.PHONY: all
all: $(MULTIPLE_NAMES) $(MULTIPLE_IDS) $(EARNINGS_WITH_IDS) $(ROSTER) $(EARNINGS_WITH_IDS_XLSX)

.PHONY: clean
clean:
	rm -rf output && mkdir -p output && touch output/.keep

.PHONY: clean-input
clean-input:
	rm -rf input && mkdir -p input && touch input/.keep

.PHONY: docker-build
docker-build:
	docker build -t boston_pd_earnings .

.PHONY: docker-run
docker-run:
	touch env.list && docker run --rm --env-file env.list -v `pwd`:/volume -ti boston_pd_earnings sh

.PHONY: pry
pry:
	pry -r ./lib/main.rb

.PHONY: deploy
deploy: $(EARNINGS_WITH_IDS) $(EARNINGS_WITH_IDS_XLSX)
	aws s3 cp $(EARNINGS_WITH_IDS) 's3://wokewindows-data/' --acl public-read
	aws s3 cp $(EARNINGS_WITH_IDS_XLSX) 's3://wokewindows-data/' --acl public-read
