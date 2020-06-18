using Test, Countries, Compat

props = []

@testset "Countries" begin
    @test @inferred(Country("UK")) isa Country
    @test @inferred(Country(:USA)) isa Country
    @test_throws Exception Country("notacountry")
    list = Tuple{Symbol,DataType,Tuple{Any,Any}}[(:iso3166_numeric, Int64, (826, 250)), (:official_name_ar, String, ("المملكة المتحدة لبريطانيا العظمى وآيرلندا الشمالية", "فرنسا")), (:official_name_cn, String, ("大不列颠及北爱尔兰联合王国", "法国")), (:official_name_en, String, ("United Kingdom of Great Britain and Northern Ireland", "France")), (:official_name_es, String, ("Reino Unido de Gran Bretaña e Irlanda del Norte", "Francia")), (:official_name_fr, String, ("Royaume-Uni de Grande-Bretagne et d'Irlande du Nord", "France")), (:official_name_ru, String, ("Соединенное Королевство Великобритании и Северной Ирландии", "Франция")), (:iso3166_alpha2, Symbol, (:GB, :FR)), (:iso3166_alpha3, Symbol, (:GBR, :FRA)), (:unterm_formal_name_ar, String, ("المملكة المتحدة لبريطانيا العظمى وآيرلندا الشمالية", "الجمهورية الفرنسية")), (:unterm_short_name_ar, String, ("المملكة المتحدة لبريطانيا العظمى وآيرلندا الشمالية", "فرنسا")), (:unterm_formal_name_cn, String, ("大不列颠及北爱尔兰联合王国", "法兰西共和国")), (:unterm_short_name_cn, String, ("大不列颠及北爱尔兰联合王国", "法国")), (:unterm_formal_name_en, String, ("the United Kingdom of Great Britain and Northern Ireland", "the French Republic")), (:unterm_short_name_en, String, ("United Kingdom of Great Britain and Northern Ireland (the)", "France")), (:unterm_formal_name_fr, String, ("le Royaume-Uni de Grande- Bretagne et d'Irlande du Nord", "la République française")), (:unterm_short_name_fr, String, ("Royaume-Uni de Grande-Bretagne et d'Irlande du Nord (le)", "France (la)")), (:unterm_formal_name_ru, String, ("Соединенное Королевство Великобритании и Северной Ирландии", "Французская Республика")), (:unterm_short_name_ru, String, ("Соединенное Королевство Великобритании и Северной Ирландии", "Франция")), (:unterm_formal_name_es, String, ("el Reino Unido de Gran Bretaña e Irlanda del Norte", "la República Francesa")), (:unterm_short_name_es, String, ("Reino Unido de Gran Bretaña e Irlanda del Norte (el)", "Francia")), (:cldr_name_en, String, ("UK", "France")), (:tld_name, String, (".uk", ".fr")), (:wmo_code, Symbol, (:UK, :FR)), (:fips_code, Symbol, (:UK, :FR)), (:fifa_code, Symbol, (Symbol("ENG,NIR,SCO,WAL"), :FRA)), (:ioc_code, Symbol, (:GBR, :FRA)), (:continent_code, Symbol, (:EU, :EU)), (:capital_name_en, String, ("London", "Paris")), (:iso3166_numeric, Int64, (826, 250))]
    cs = (Country("UK"), Country("FR"))
    for (a,t,vs) in list
        for (c,v) in zip(cs,vs)
            @test @inferred(t, getproperty(c,a)) == v
        end
    end
end
