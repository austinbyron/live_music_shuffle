import sys
from internetarchive import get_item
from internetarchive import search_items
from internetarchive import get_session



#test = ["test", "test2", "test4"]

shows = []

def main():

    queryResults = open("searchresults.txt", "w+")
    #g = raw_input("Enter collection to search: ")
    #s = get_session()
    #s.mount_http_adapter()
    name = ""
    exiter = False
    while (exiter == False):
        print("1: Grateful Dead Soundboards")
        print("2: Dead and Company")
        print("3: Umphrey's Mcgee")
        print("4: Billy Strings")
        print("5: Goose")
        print("6: String Cheese Incident")
        print("7: Derek Trucks Band")
        print("8: Lotus")
        print("9: STS9")
        print("10: Joe Russo's Almost Dead")
        print("11: Keller Williams")
        print("12: John Mayer")
        print("13: Tedeschi Trucks Band")
        print("14: Dark Star Orchestra")
        print("15: My Morning Jacket")
        print("16: moe.")
        print("17: Little Feat")
        print("18: Twiddle")
        print("19: Ween")
        print("20: Spafford")
        print("21: Pigeons Playing Ping Pong")
        print("22: Soulive")
        print("23: Greensky Bluegrass")
        print("24: Phil Lesh and Friends")
        print("25: Perpetual Groove")
        print("26: Disco Biscuits")
        print("27: Cracker")
        print("28: Yonder Mountain String Band")
        print("29: Blues Traveler")
        print("30: John Butler Trio")
        print("31: Joe Russo Presents: Hooteroll?")
        print("32: Smashing Pumpkins")
        print("33: Ratdog")
        print("34: The Dead")
        print("35: Vulfpeck")
        print("36: The Other Ones")
        print("37: Jeff Austin Band")
        print("38: Robert Hunter")
        print("39: Psychedelic Breakfast")
        #groups to add:
        #moe., little feat, twiddle, ween, spafford
        #pigeons playing ping pong, greensky bluegrass
        #phil lesh and friends, perpetual groove,
        #disco biscuits, cracker, yonder mountain string band
        #blues traveler, john butler trio,
        #joe russo presents: hooteroll? + plus (add to joe russo json file?)
        #smashing pumpkins
        print("0 to exit")
        g = input("Enter collection to search:\n ")
        if g == 1:
            name = "gratefuldead"
            search_results = search_items('collection:GratefulDead and stream_only')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 2:
            name = "deadandco"
            search_results = search_items('collection:DeadAndCompany')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 3:
            name = "umphreysmcgee"
            search_results = search_items('collection:UmphreysMcgee')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 4:
            name = "billystrings"
            search_results = search_items('collection:BillyStrings')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 5:
            name = "gooseband"
            search_results = search_items('collection:GooseBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 6:
            name = "stringcheeseincident"
            search_results = search_items('collection:StringCheeseIncident')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 7:
            name = "derektrucksband"
            search_results = search_items('collection:DerekTrucksBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 8:
            name = "lotusband"
            search_results = search_items('collection:Lotus')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 9:
            name = "soundtribesector9"
            search_results = search_items('collection:SoundTribeSector9')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 10:
            name = "joerusso"
            search_results = search_items('collection:JoeRussosAlmostDead')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 11:
            name = "kellerwilliams"
            search_results = search_items('collection:KellerWilliams')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 12:
            name = "johnmayer"
            search_results = search_items('collection:JohnMayerMusic')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 13:
            name = "tedeschitrucksband"
            search_results = search_items('collection:TedeschiTrucksBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 14:
            name = "darkstarorchestra"
            search_results = search_items('collection:DarkStarOrchestra')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 15:
            name = "mymorningjacket"
            search_results = search_items('collection:MyMorningJacket')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 16:
            name = "moe"
            search_results = search_items('collection:moe')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 17:
            name = "littlefeat"
            search_results = search_items('collection:LittleFeat')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 18:
            name = "twiddle"
            search_results = search_items('collection:Twiddle')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 19:
            name = "ween"
            search_results = search_items('collection:Ween')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 20:
            name = "spafford"
            search_results = search_items('collection:Spafford')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 21:
            name = "pigeonsplayingpingpong"
            search_results = search_items('collection:PigeonsPlayingPingPong')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 22:
            name = "soulive"
            search_results = search_items('collection:Soulive')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 23:
            name = "greenskybluegrass"
            search_results = search_items('collection:GreenskyBluegrass')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 24:
            name = "philleshandfriends"
            search_results = search_items('collection:PhilLeshandFriends')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 25:
            name = "perpetualgroove"
            search_results = search_items('collection:PerpetualGroove')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 26:
            name = "discobiscuits"
            search_results = search_items('collection:DiscoBiscuits')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 27:
            name = "cracker"
            search_results = search_items('collection:Cracker')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 28:
            name = "yondermountainstringband"
            search_results = search_items('collection:YonderMountainStringBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 29:
            name = "bluestraveler"
            search_results = search_items('collection:BluesTraveler')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 30:
            name = "johnbutlertrio"
            search_results = search_items('collection:JohnButlerTrio')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 31:
            name = "joerussohooteroll"
            search_results = search_items('collection:JoeRussoPresentsHooterollPlus')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 32:
            name = "smashingpumpkins"
            search_results = search_items('collection:SmashingPumpkins')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 33:
            name = "ratdog"
            search_results = search_items('collection:Ratdog')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 34:
            name = "thedead"
            search_results = search_items('collection:TheDead')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 35:
            name = "vulfpeck"
            search_results = search_items('collection:Vulfpeck')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 36:
            name = "theotherones"
            search_results = search_items('collection:TheOtherOnes')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 37:
            name = "jeffaustinband"
            search_results = search_items('collection:JeffAustinBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 38:
            name = "roberthunter"
            search_results = search_items('collection:RobertHunter')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 39:
            name = "psychedelicbreakfast"
            search_results = search_items('collection:PsychedelicBreakfast')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 0:
            exiter = True
        else: 
            print("Please try again")
    
    
    #queryResults.write(search_results.num_found)
    queryResults.close()
    f = open("temp.txt", "w+")
    print(len(shows))
    #print(len(test))
    #print(shows[0])
    #print(test[0])
    #test = get_item(shows[2])
    #print(test.item_metadata.keys())
    #print(test.item_metadata['files'][0]['name'])
    
    f.write("{\n")
    for x in shows:
        #print(List[x])
        item = get_item(x)
        #f.write("\"%s\"" % x)
        f.write("\"%s\": [" % x)
        if item.item_metadata.get('files'):
            for i in item.item_metadata['files']:
                if i['format'] == "VBR MP3":
                    f.write("\n{\n")
                    if i.get('name'):
                        if isinstance(i['name'], unicode):
                            strg = i['name'].encode('utf-8')
                            f.write("\"name\": \"%s\", \n" % strg)
                        else:
                            f.write("\"name\": \"%s\", \n" % i['name'])
                    if i.get('creator'):
                        if isinstance(i['creator'], unicode):
                            strg = i['creator'].encode('utf-8')
                            strg = strg.replace("\"", "")
                            strg = strg.replace("\\", "")
                            strg = strg.replace("\n", "")
                            f.write("\"creator\": \"%s\", \n" % strg)
                        else:
                            strg = i['creator']
                            strg = strg.replace("\"", "")
                            strg = strg.replace("\\", "")
                            strg = strg.replace("\n", "")
                            f.write("\"creator\": \"%s\", \n" % strg)
                    if i.get('title'):
                        if isinstance(i['title'], unicode):
                            strg = i['title'].encode('utf-8')
                            strg = strg.replace("\"", "")
                            strg = strg.replace("\\", "")
                            strg = strg.replace("\n", "")
                            f.write("\"title\": \"%s\", \n" % strg)
                        else:
                            strg = i['title']
                            strg = strg.replace("\"", "")
                            strg = strg.replace("\\", "")
                            strg = strg.replace("\n", "")
                            f.write("\"title\": \"%s\", \n" % strg)
                    if i.get('album'):
                        if isinstance(i['album'], unicode):
                            strg = i['album'].encode('utf-8')
                            strg = strg.replace("\"", "")
                            strg = strg.replace("\\", "")
                            strg = strg.replace("\n", "")
                            f.write("\"album\": \"%s\", \n" % strg)
                        else:
                            strg = i['album']
                            strg = strg.replace("\"", "")
                            strg = strg.replace("\\", "")
                            strg = strg.replace("\n\n", "")
                            f.write("\"album\": \"%s\", \n" % strg)
                    #f.write("\"album\": \"%s\", \n" % i['album'])
                    if i.get('track'):
                        f.write("\"track\": \"%s\", \n" % i['track'])
                    if i.get('length'):
                        f.write("\"length\": \"%s\", \n" % i['length'])
                    f.write("\"format\": \"%s\" \n" % i['format'])
                    if i == item.item_metadata['files'][-1]:
                        f.write("}")
                    else:
                        f.write("},")
            if x == shows[-1]:
                f.write("]\n")
            else:
                f.write("],\n")

        
    f.write("}")
    f.close()


    
    fin = open("temp.txt", "r+")
    filename = "%s.json" % name
    fout = open(filename, "w+")

    for line in fin:

        fout.write(line.replace('},]', '}]'))
    fin.close()
    fout.close()
    

if __name__ == '__main__':
    main()

