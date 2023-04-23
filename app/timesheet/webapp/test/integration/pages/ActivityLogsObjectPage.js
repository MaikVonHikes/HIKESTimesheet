sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'hikes.timesheet.timesheet',
            componentId: 'ActivityLogsObjectPage',
            entitySet: 'ActivityLogs'
        },
        CustomPageDefinitions
    );
});