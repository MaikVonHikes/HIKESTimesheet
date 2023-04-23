sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'hikes/timesheet/timesheet/test/integration/FirstJourney',
		'hikes/timesheet/timesheet/test/integration/pages/ActivityLogsList',
		'hikes/timesheet/timesheet/test/integration/pages/ActivityLogsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ActivityLogsList, ActivityLogsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('hikes/timesheet/timesheet') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheActivityLogsList: ActivityLogsList,
					onTheActivityLogsObjectPage: ActivityLogsObjectPage
                }
            },
            opaJourney.run
        );
    }
);