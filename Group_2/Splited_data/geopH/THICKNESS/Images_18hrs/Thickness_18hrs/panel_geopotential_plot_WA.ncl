  
;--------------------------------------------------

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
;-- read data and set variable references
   f1 = addfile("monmean_thickness_18hrs.nc_01.nc","r")
   f2 = addfile("monmean_thickness_18hrs.nc_02.nc","r")
   f3 = addfile("monmean_thickness_18hrs.nc_03.nc","r") 
   f4 = addfile("monmean_thickness_18hrs.nc_04.nc","r")
   f5 = addfile("monmean_thickness_18hrs.nc_05.nc","r")
   f6 = addfile("monmean_thickness_18hrs.nc_06.nc","r")
   f7 = addfile("monmean_thickness_18hrs.nc_07.nc","r")
   f8 = addfile("monmean_thickness_18hrs.nc_08.nc","r")
   f9 = addfile("monmean_thickness_18hrs.nc_09.nc","r")
   f10 = addfile("monmean_thickness_18hrs.nc_10.nc","r")
   f11 = addfile("monmean_thickness_18hrs.nc_11.nc","r")
   f12 = addfile("monmean_thickness_18hrs.nc_12.nc","r")

   T1 = f1->Z
   T2 = f2->Z
   T3 = f3->Z
   T4 = f4->Z
   T5 = f5->Z
   T6 = f6->Z
   T7 = f7->Z
   T8 = f8->Z
   T9 = f9->Z
   T10 = f10->Z
   T11 = f11->Z
   T12 = f12->Z
   latitude   = f1->latitude
   longitude   = f1->longitude

; Change the lat lon units of prec1..4 degrees_north and degrees_east
   ; prec1&lat@units="degrees_north"
  ;  prec1&lon@units="degrees_east"
   ; prec2&lat@units="degrees_north"
   ; prec2&lon@units="degrees_east"
   ; prec3&lat@units="degrees_north"
   ; prec3&lon@units="degrees_east"
    ;prec4&lat@units="degrees_north"
    ;prec4&lon@units="degrees_east"


;-- open a PNG file
   wks = gsn_open_wks("png","1980-1982_06hrs__monthly_mean_THICKNESS_for_west_africa")

;-- create plot array
   plot = new(12,graphic)

   gsn_define_colormap(wks,"BlAqGrWh2YeOrReVi22")                         ;-- change

;-- set resources

   res                                                            = True           ;-- resource varb
             
  



   res@mpFillOn                                                   = False        ; turn off gray fill
   res@cnConstFEnableFill                                         = True
   res@mpOutlineBoundarySets                                      = "National"   ; turn on country boundaries
   res@mpGeophysicalLineColor                                     = "Black"       ; color of cont. outlines
   res@mpGeophysicalLineThicknessF                                = 1.5          ; thickness of outlines

   
   res@lbLabelBarOn                                               = True         ; turn On individual cb's
   res@gsnMaximize                                                = True
   res@vpWidthF                                                   = 0.8     ; make the plot wider than it is high
   res@vpHeightF                                                  = 0.8

   res@cnFillOn                                                   = True           ;-- turn on color
   res@cnLinesOn                                                  = False          ;-- no contour lines
   res@cnLineLabelsOn                                             = False          ;-- turn off line labels
   res@lbBoxMinorExtentF                                          = 0.15           ;-- decrease the height of the labelbar
   res@lbOrientation                                              = "vertical"     ;-- orientation of colour bar
   res@tiMainOn                                                   = True
   res@tiMainFontHeightF                                          = 0.03           ;-- main title height
   res@tiMainFont                                                 = 26             ;-- main title font size
   res@tiMainString                                               = "Geopotential"
   res@tiXAxisString                                              = longitude@long_name
   res@tiYAxisString                                              = latitude@long_name
   res@tiXAxisOffsetXF                                            = -0.02           ;-- move x-axis label away from the y-line
   res@tiXAxisOffsetYF                                            = -0.001           ;-- move x-axis label away from the x-line 
   res@tiYAxisOffsetXF                                            = -0.01           ;-- move y-axis label away from the y-line
   res@tiYAxisOffsetYF                                            = -0.05           ;-- move y-axis label away from the x-line

   res@cnLevelSelectionMode                                       = "AutomaticLevels" ;-- set contour levels manually
   ;res@cnMinLevelValF                                             = -32767           ;-- minimum contour level
   ;res@cnMaxLevelValF                                             = -32767            ;-- maximum contour level
   ;res@cnLevelSpacingF                                            = 2              ;-- contour level spacing
;-- Set the map (lon/lat) limits
   res@mpMinLatF                                                  = -10       
   res@mpMaxLatF                                                  = 40
   res@mpMinLonF                                                  = -23
   res@mpMaxLonF                                                  = 25
   
   
   res@gsnSpreadColors                                             = True         ;-- full colors
   res@pmLabelBarDisplayMode                                       = "Always"

   res@mpDataBaseVersion                                          = "MediumRes"  ;-- better map resolution
   res@gsnAddCyclic                                               = False       ;-- Do not add cyclic value since it is regional not global

   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_01"
   plot(0) = gsn_csm_contour_map(wks,T1(0,0,:,:),res)               
   
 
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_02"
   plot(1) = gsn_csm_contour_map(wks,T2(0,0,:,:),res)
   
    
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_03"
   plot(2) = gsn_csm_contour_map(wks,T3(0,0,:,:),res)
   
 
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_04"
   plot(3) = gsn_csm_contour_map(wks,T4(0,0,:,:),res)
   
    
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_05"
   plot(4) = gsn_csm_contour_map(wks,T5(0,0,:,:),res)
 
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_06"
   plot(5) = gsn_csm_contour_map(wks,T6(0,0,:,:),res)
   
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_07"
   plot(6) = gsn_csm_contour_map(wks,T7(0,0,:,:),res)
   
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_08"
   plot(7) = gsn_csm_contour_map(wks,T8(0,0,:,:),res)
   
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_09"
   plot(8) = gsn_csm_contour_map(wks,T9(0,0,:,:),res)
   
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_10"
   plot(9) = gsn_csm_contour_map(wks,T10(0,0,:,:),res)
   
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_11"
   plot(10) = gsn_csm_contour_map(wks,T11(0,0,:,:),res)
   
   res@tiMainString                                               = "monthly_mean_THICKNESS_18hrs_12"
   plot(11) = gsn_csm_contour_map(wks,T12(0,0,:,:),res)


   resP                                                          = True 
   resP@txString                                                 = "1980-1982_18hrs_monthly_mean_THICKNESS_for_west_africa"
   resP@gsnPanelLabelBar                                          = True                ; add common colorbar
   resP@lbLabelFontHeightF                                        = 0.015               ; make labels smaller 

   gsn_panel(wks,plot,(/2,6/),resP)

end
