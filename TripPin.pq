// This file contains your Data Connector logic
[Version = "1.0.0"]
section TripPin;

[DataSource.Kind="TripPin", Publish="TripPin.Publish"]
shared TripPin.Contents = (optional message as text) =>
    let
        _message = if (message <> null) then message else "(no message)",
        a = "Hello from TripPin: " & _message
    in
        a;

// Data Source Kind description
TripPin = [
    Authentication = [
        // Key = [],
        // UsernamePassword = [],
        // Windows = [],
        Anonymous = []
    ]
];

// Data Source UI publishing description
TripPin.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = TripPin.Icons,
    SourceTypeImage = TripPin.Icons
];

TripPin.Icons = [
    Icon16 = { Extension.Contents("TripPin16.png"), Extension.Contents("TripPin20.png"), Extension.Contents("TripPin24.png"), Extension.Contents("TripPin32.png") },
    Icon32 = { Extension.Contents("TripPin32.png"), Extension.Contents("TripPin40.png"), Extension.Contents("TripPin48.png"), Extension.Contents("TripPin64.png") }
];
