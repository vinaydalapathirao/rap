@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection CDS'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZVCONNECTION as select from /dmo/connection as CONNECTION
association [1..1] to /DMO/I_Carrier as _Airline
    on $projection.carrier = _Airline.AirlineID
{
    @ObjectModel.text.association: '_Airline'
    key CONNECTION.carrier_id as carrier,
    key CONNECTION.connection_id as connectionid,
    _Airline // Make association public    
}
