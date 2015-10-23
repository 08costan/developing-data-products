library(shiny)
library(datasets)

getDataDescription <- function(ds){
    r<-data()$results[data()$results[,3]==ds,4]
    names(r)<-NULL
    r
}

# Function to extract help pages in HTML format
# Source: http://stackoverflow.com/questions/9192589/how-can-i-extract-text-from-rs-help-command
extract_help <- function(pkg, fn = NULL, to = c("txt", "html", "latex", "ex"))
{
    # Custom pre-processing
    if(grepl("\\(",fn)){
        fn<-gsub("^.*\\(", "",fn)
        fn<-gsub("\\)","",fn)
    }
    
    # Source code taken from Stack Overflow
    to <- match.arg(to)
    rdbfile <- file.path(find.package(pkg), "help", pkg)
    rdb <- tools:::fetchRdDB(rdbfile, key = fn)
    convertor <- switch(to, 
                        txt   = tools::Rd2txt, 
                        html  = tools::Rd2HTML, 
                        latex = tools::Rd2latex, 
                        ex    = tools::Rd2ex
    )
    f <- function(x) capture.output(convertor(x))
    if(is.null(fn)) out<-lapply(rdb, f) else out<-f(rdb)
    
    # Custom output
    result<-""
    for(i in 1:length(out)){
        result<-paste(result,out[i])
    }
    result
}


# Main function
shinyServer(function(input, output, session) {

    datasetInput <- reactive({
        switch(input$dataset,
               "AirPassengers"=AirPassengers,"BJsales" =BJsales,"BJsales.lead (BJsales)"=BJsales.lead,
               "BOD"=BOD,"CO2"=CO2,"ChickWeight"=ChickWeight,"DNase"=DNase,"EuStockMarkets"=EuStockMarkets,
               "Formaldehyde"=Formaldehyde,"HairEyeColor"=HairEyeColor,"Harman23.cor"=Harman23.cor,
               "Harman74.cor"=Harman74.cor,"Indometh"=Indometh,"InsectSprays"=InsectSprays,"JohnsonJohnson"=JohnsonJohnson,
               "LakeHuron"=LakeHuron,"LifeCycleSavings"=LifeCycleSavings,"Loblolly"=Loblolly,"Nile"=Nile,
               "Orange"=Orange,"OrchardSprays"=OrchardSprays,"PlantGrowth"=PlantGrowth,"Puromycin"=Puromycin,
               "Seatbelts"=Seatbelts,"Theoph"=Theoph,"Titanic"=Titanic,"ToothGrowth"=ToothGrowth,"UCBAdmissions"=UCBAdmissions,
               "UKDriverDeaths"=UKDriverDeaths,"UKgas"=UKgas,"USAccDeaths"=USAccDeaths,"USArrests"=USArrests,
               "USJudgeRatings"=USJudgeRatings,"USPersonalExpenditure"=USPersonalExpenditure,"UScitiesD"=as.numeric(UScitiesD),
               "VADeaths"=VADeaths,"WWWusage"=WWWusage,"WorldPhones"=WorldPhones,"ability.cov"=ability.cov,"airmiles"=airmiles,
               "airquality"=airquality,"anscombe"=anscombe,"attenu"=attenu,"attitude"=attitude,"austres"=austres,"beaver1 (beavers)"=beaver1,
               "beaver2 (beavers)"=beaver2,"cars"=cars,"chickwts"=chickwts,"co2"=co2,"crimtab"=crimtab,"discoveries"=discoveries,
               "esoph"=esoph,"euro"=euro,"euro.cross (euro)"=euro.cross,"eurodist"=as.numeric(eurodist),"faithful"=faithful,"fdeaths (UKLungDeaths)"=fdeaths,
               "freeny"=freeny,"freeny.x (freeny)"=freeny.x,"freeny.y (freeny)"=freeny.y,"infert"=infert,"iris"=iris,"iris3"=iris3,"islands"=islands,
               "ldeaths (UKLungDeaths)"=ldeaths,"lh"=lh,"longley"=longley,"lynx"=lynx,"mdeaths (UKLungDeaths)"=mdeaths,"morley"=morley,"mtcars"=mtcars,
               "nhtemp"=nhtemp,"nottem"=nottem,"npk"=npk,"occupationalStatus"=occupationalStatus,"precip"=precip,"presidents"=presidents,"pressure"=pressure,
               "quakes"=quakes,"randu"=randu,"rivers"=rivers,"rock"=rock,"sleep"=sleep,"stack.loss (stackloss)"=stack.loss,"stack.x (stackloss)"=stack.x,"stackloss"=stackloss,
               "state.abb (state)"=state.abb,"state.area (state)"=state.area,"state.center (state)"=state.center,"state.division (state)"=state.division,
               "state.name (state)"=state.name,"state.region (state)"=state.region,"state.x77 (state)"=state.x77,"sunspot.month"=sunspot.month,
               "sunspot.year"=sunspot.year,"sunspots"=sunspots,"swiss"=swiss,"treering"=treering,"trees"=trees,"uspop"=uspop,"volcano"=volcano,"warpbreaks"=warpbreaks,"women"=women)
    })
    
    output$caption <- renderText({
        input$caption
    })
    
    output$summary <- renderPrint({
        dataset <- datasetInput()
        head(dataset)
    })
    
    output$dsDescription <- renderPrint({getDataDescription(input$dataset)})
    output$dsHelp <- renderPrint({extract_help(pkg="datasets",input$dataset,"html")})
    output$view <- renderDataTable(data.frame(datasetInput()), options = list(pageLength = 10))
    
})