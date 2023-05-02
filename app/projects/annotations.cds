using TimesheetService as service from '../../srv/timesheet-service';

annotate service.Projects with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: name,
    },
    {
        $Type: 'UI.DataField',
        Value: budget,
    },
    {
        $Type      : 'UI.DataField',
        Value      : remainingBudget,
        Criticality: remainingBudgetCriticality,
    },
    {
        $Type: 'UI.DataField',
        Value: validFrom,
    },
    {
        $Type: 'UI.DataField',
        Value: validTo,
    },
    {
        $Type: 'UI.DataField',
        Value: contract,
    },
]);

annotate service.Projects with @(
    UI.FieldGroup #Main: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: budget,
            },
            {
                $Type      : 'UI.DataField',
                Value      : remainingBudget,
                Criticality: remainingBudgetCriticality,
            },
            {
                $Type: 'UI.DataField',
                Value: validFrom,
            },
            {
                $Type: 'UI.DataField',
                Value: validTo,
            },
        ],
    },
    UI.Facets          : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneralInformation',
        Label : 'General Information',
        Target: '@UI.FieldGroup#Main',
    }, ]
);
