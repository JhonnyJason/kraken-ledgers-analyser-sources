############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("historydisplaymodule")
#endregion



############################################################
export initialize = ->
    log "initialize"
    ## Fetch ledgers.csv
    response = await fetch("/ledgers.csv")
    if !response.ok then throw new Error("Fetch CSV returned statuscode: #{response.status}")
    ledgers = await response.text()
    digestLedgersCSV(ledgers)
    return


digestLedgersCSV = (ledgers) ->
    log "digestLedgersCSV"
    ledgerLines = ledgers.split("\n")
    log ledgerLines[0]
    return