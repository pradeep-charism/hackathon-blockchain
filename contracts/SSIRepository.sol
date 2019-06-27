pragma solidity ^0.5.8;

contract SSIRepository {

    string suffix = "->PUBLIC_KEY";

    struct Ssi {
        string currency;
        string correspondentBankName;
        string city;
        string accountNumber;
        string swiftId;
    }

    mapping(string => Ssi) SsiRepo;

    function RegisterBankSsi(string memory key, string memory currency, string memory correspondentBankName, string memory city, string memory accountNumber, string memory swiftId) public {
        Ssi memory newSsi;
        newSsi.currency = currency;
        newSsi.correspondentBankName = correspondentBankName;
        newSsi.city = city;
        newSsi.accountNumber = accountNumber;
        newSsi.swiftId = swiftId;

        SsiRepo[key] = newSsi;
    }

    function GetSsiFor(string memory key) public returns (string memory, string memory, string memory, string memory, string memory)    {
        return (SsiRepo[key].currency, SsiRepo[key].correspondentBankName, SsiRepo[key].city, SsiRepo[key].accountNumber, SsiRepo[key].swiftId);
    }

    function Description() public returns (string memory)    {
        return "This contract will provide SSI for the bank key lookup.";
    }
}





/*
var ssi
SSIRepository.deployed().then(function (deployed) {ssi=deployed;});
ssi.RegisterBankSsi("WELLS FARGO->PUBLIC_KEY:JP MORGAN->PUBLIC_KEY:USD", "USD", "JP Morgan", "New York", "USD-NY-001", "USDJPMNYXXX");
ssi.RegisterBankSsi("WELLS FARGO->PUBLIC_KEY:CREDIT SUISSE->PUBLIC_KEY:CHF", "CHF", "Credit Suisse", "Zurich", "CHF-CS-ZUR-001", "CHFCSZURXXX");
ssi.RegisterBankSsi("WELLS FARGO->PUBLIC_KEY:BANK OF CHINA->PUBLIC_KEY:CNH", "CNH", "Bank of China", "Hong kong", "CNH-BOC-HK-001", "CNHBOCHKXXX");

ssi.GetSsiFor.call("WELLS FARGO->PUBLIC_KEY:JP MORGAN->PUBLIC_KEY:USD");
ssi.GetSsiFor.call("WELLS FARGO->PUBLIC_KEY:CREDIT SUISSE->PUBLIC_KEY:CHF");
ssi.GetSsiFor.call("WELLS FARGO->PUBLIC_KEY:BANK OF CHINA->PUBLIC_KEY:CNH");

s.Description.call();

*/
