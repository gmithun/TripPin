// This file contains your Data Connector logic
[Version = "1.0.0"]
section TripPin;

[DataSource.Kind = "TripPin", Publish = "TripPin.Publish"]
shared TripPin.Feed = Value.ReplaceType(TripPinImpl, type function (url as Uri.Type) as any);

DefaultRequestHeaders = [
    #"Accept" = "application/json;odata.metadata=minimal",
    #"OData-MaxVersion" = "4.0"
];

TripPinImpl = (url as text) =>
    let
        source = Web.Contents(url, [ Headers = DefaultRequestHeaders ]),
        json = Json.Document(source)
    in
        json;

// Data Source Kind description
TripPin = [
    Authentication = [
        Anonymous = []
    ],
    Label = "TripPin"
];

// Data Source UI publishing description
TripPin.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = {"TripPin OData", "TripPin OData"}
];
