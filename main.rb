require 'net/http'
require 'date'

stocks = %w(nept mgic cgen enzy uihc clny ampe dpm full nbix snss ino smlr ale wyy acpw trnx alsn ainv pgnx fang cytk kyn oaks arwr amda ingn nna qtww cfx dov blvdu cnce dwch atrc mgnx flxn tlmr egrx ibp ptct prgn fsl opht csiq irwd ato nrx pbyi ston nmm mtsn args urre fprx athl rndy rnvc ebio cmfn eglt ladr nlst aspx cbpx gnca qure bioc agen epzm halo evhc mbuu trvn snow mont mcc tisa tnp cytr rxn sxe xpo fuel drna cldn gern tsro bku petx atax ras ahp amid dsci eopn irt kips nstg tcbi tnxp xnpt exel hpp kerx nktr splk xlrn jks cvt fcel orbc orc corr resi ihs wday aezs full bota mth ncs rtrx gwph rcpt bxmt vrtu cdr rse kw nymt pbf pky ent gig spcb opxa xoma admp rgdx tcpc nrf pf seas syn tam cstm away amid ta gmlp)

today = DateTime.now.strftime("%Y-%m-%d")

directory = "#{File.dirname(__FILE__)}/#{today}" 
Dir.mkdir(directory)

stocks.each do |stock|
  # Must be somedomain.net instead of somedomain.net/, otherwise, it will throw exception.
  Net::HTTP.start("ichart.finance.yahoo.com") do |http|
    resp = http.get("/table.csv?s=#{stock}&d=2&e=3&f=2014&g=d&a=11&b=15&c=2005&ignore=.csv")
    open("#{directory}/#{stock}-#{today}.csv", "wb") do |file|
      file.write(resp.body)
    end
  end
  puts "#{stock} Done."
end
