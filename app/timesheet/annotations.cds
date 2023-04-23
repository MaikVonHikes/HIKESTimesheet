using TimesheetService as service from '../../srv/timesheet-service';

annotate TimesheetService.ActivityLogs with @(UI: {
    HeaderInfo         : {
        TypeName      : 'Activity Log',
        TypeNamePlural: 'Activity Logs',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: date
        }
    },
    SelectionFields    : [date],
    Identification     : [{Value: ID}],

    LineItem           : [
        {Value: ID},
        {Value: employee_ID},
        {Value: project_ID},
        {Value: date},
        {Value: timeFrom},
        {Value: timeTo},
        {Value: break},
        {Value: description},
    ],


    Facets             : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target: '@UI.FieldGroup#Main',
    }],

    FieldGroup #Main   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Value: employee_ID
            },
            {
                $Type: 'UI.DataField',
                Value: project_ID
            },
            {
                $Type: 'UI.DataField',
                Value: date
            },
            {
                $Type: 'UI.DataField',
                Value: timeFrom
            },
            {
                $Type: 'UI.DataField',
                Value: timeTo
            },
            {
                $Type: 'UI.DataField',
                Value: break
            },
            {
                $Type: 'UI.DataField',
                Value: description
            },
        ]
    },

    FieldGroup #Project: {Data: [
        {
            $Type: 'UI.DataField',
            Value: project_ID
        },
        {
            $Type: 'UI.DataField',
            Value: project.name
        },
        {
            $Type: 'UI.DataField',
            Value: project.customer_ID
        },
        {
            $Type: 'UI.DataField',
            Value: project.budget
        },
        {
            $Type: 'UI.DataField',
            Value: project.validFrom
        },
        {
            $Type: 'UI.DataField',
            Value: project.validTo
        }
    ]},
});
