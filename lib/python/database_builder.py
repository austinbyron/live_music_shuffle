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
            search_results = search_items('collection:GratefulDead and stream_only')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 2:
            search_results = search_items('collection:DeadAndCompany')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 3:
            search_results = search_items('collection:UmphreysMcgee')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 4:
            search_results = search_items('collection:BillyStrings')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 5:
            search_results = search_items('collection:GooseBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 6:
            search_results = search_items('collection:StringCheeseIncident')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 7:
            search_results = search_items('collection:DerekTrucksBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 8:
            search_results = search_items('collection:Lotus')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 9:
            search_results = search_items('collection:SoundTribeSector9')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 10:
            search_results = search_items('collection:JoeRussosAlmostDead')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 11:
            search_results = search_items('collection:KellerWilliams')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 12:
            search_results = search_items('collection:JohnMayerMusic')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 13:
            search_results = search_items('collection:TedeschiTrucksBand')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 14:
            search_results = search_items('collection:DarkStarOrchestra')
            print(search_results.num_found)
            for result in search_results:
                queryResults.write(result['identifier'] + '\n')
                shows.append(result['identifier'])
        elif g == 15:
            search_results = search_items('collection:MyMorningJacket')
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
    fout = open("darkstarorchestra.json", "w+")

    for line in fin:
        fout.write(line.replace('},]', '}]'))
    fin.close()
    fout.close()
    

if __name__ == '__main__':
    main()

