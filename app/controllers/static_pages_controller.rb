class StaticPagesController < ApplicationController
 def home
 @banner_title="your apps"
 @banner_text1="On The Cloud"
 @banner_text2="Build your appliance with XBS and push it to Xamin SaaS Market. A chance of running your application on the cloud, by your customers and make money for you"
 @xbs_definition="Xamin Build Studio is a cloud service to provide online appliance building environment, for ISVs, application developers and software integrators, to convert their software application to Xamin Ready appliance, situable to run on public cloud"; 
#read from database(which is inserted by BS administrator)
 end
end
