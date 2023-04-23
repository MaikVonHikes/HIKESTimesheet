using hikes.timesheet as ts from '../db/data-model';

annotate ts.ActivityLogs with {
    ID          @(UI.Hidden);
    employee    @title: 'Employee';
    project     @title: 'Project';
    date        @title: 'Date';
    hours       @title: 'Hours';
    timeFrom    @title: 'Start';
    timeTo      @title: 'End';
    break       @title: 'Break';
    description @title: 'Description';
}

annotate ts.Projects with {
    ID        @(
        UI.Hidden,
        Common.Text: name
    );
    name      @title: 'Name';
    customer  @title: 'Customer';
    budget    @title: 'Budget';
    remainingBudget @title: 'Remaining Budget';
    validFrom @title: 'Valid From';
    validTo   @title: 'Valid To';
    contract @title: 'Contract in €';
    remainingBudgetCriticality @title: 'RemainingBudgetCriticality';
}

annotate ts.Employees with {
    ID        @(
        UI.Hidden,
        Common.Text: lastName
    );
    firstName @title: 'First Name';
    lastName  @title: 'Last Name';
}

annotate ts.Customers with {
    ID   @(
        UI.Hidden,
        Common.Text: name
    );
    name @title: 'Name';
}

annotate ts.ActivityLogs with {
    employee @(Common: {
        Text: employee.lastName,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Employees',
            Label: 'Employees',
            Parameters: [{
                $Type: 'Common.ValueListParameterInOut',
                LocalDataProperty: employee_ID,
                ValueListProperty: 'ID'
            }, {
                $Type: 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'firstName'
            }, {
                $Type: 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'lastName'
            }]
        },
    });

    project @(Common: {
        Text: project.name,
        TextArrangement: #TextOnly,
        ValueList: {
            $Type: 'Common.ValueListType',
            CollectionPath: 'Projects',
            Label: 'Projects',
            Parameters: [{
                $Type: 'Common.ValueListParameterInOut',
                LocalDataProperty: project_ID,
                ValueListProperty: 'ID'
            }, {
                $Type: 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }]
        }
    })
}
