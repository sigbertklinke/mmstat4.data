## ------------------------------------------------------------------------------------------------------------------------
gss   <- import("https://shinyapps.wiwi.hu-berlin.de/d/GSS.SAV")
t.test(age~richwork, data=gss)
t.test(educ~richwork, data=gss)
t.test(tvhours~richwork, data=gss)

