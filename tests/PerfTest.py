# PerfTest.py by Takumi Fujimoto <takumif>
# Measures the time it takes to load Etherpad home and editor pages.
# Requires selenium to be installed (e.g. via pip).

from selenium import webdriver
import time

class PerfTest(object):
    def __init__(self):
        self.driver = webdriver.Firefox()

        # list of URLs to test, and HTML tags within those pages
        # that appear when the pages are fully loaded
        self.urlsAndTags = {
            'http://localhost:9001/' : 'form',          # the top page
            'http://localhost:9001/p/page' : 'iframe'   # the editor page
        }

        self.log = ''

    def run(self):
        self.log += 'Performance (Load Time) Test Results:\n\n'

        print "Running Performance Tests . . ."

        for url in self.urlsAndTags:
            self.measureLoadTime(url)

        print 'Performance Tests Finished! The results are in results.txt.'
        self.writeLog()

    def measureLoadTime(self, url, runs=10):
        '''measure the average load time for 10 (or soem user specified
           number) trials'''

        self.log += 'Testing page: ' + url + '\n'

        loadTimeSum = 0.0
        maxTime = 0.0

        for run in range(1, runs + 1):
            loadTime = self.measureLoadTimeOnce(url)
            loadTimeSum += loadTime
            maxTime = max(loadTime, maxTime)

            self.log += '    Run #%02d: %.3fs\n' % (run, loadTime)

        average = loadTimeSum / runs
        self.log += '  -------------------\n'
        self.log += '  Max:       %.3fs\n' % maxTime
        self.log += '  Average:   %.3fs\n' % average
        self.log += '\n'

    def measureLoadTimeOnce(self, url):
        startTime = time.time()
        self.driver.get(url)
        self.waitUntilTagLoads(self.urlsAndTags[url])
        endTime = time.time()

        loadTimeInSeconds = endTime - startTime
        return loadTimeInSeconds

    def waitUntilTagLoads(self, tag):
        timeout = 10 # 10 seconds
        startTime = time.time()

        while True:
            try:
                self.driver.find_element_by_tag_name(tag)
                return
            except:
                if (time.time() - startTime > timeout):
                    return

    def writeLog(self):
        logFile = open('results.txt', 'a')
        logFile.write(self.log)
        logFile.close()
        self.log = ''

if __name__ == '__main__':
    test = PerfTest()
    test.run()